package com.conversation.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.conversation.model.Conversation;
import com.conversation.model.Message;
import com.conversation.model.User;
import com.conversation.repository.ConversationData;
import com.conversation.repository.MessageData;
import com.conversation.service.ConversationService;
import com.conversation.service.UserService;

@Controller
public class ConversationController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	ConversationService convService;
	
	@Autowired
	ConversationData convData;
	
	@Autowired
	MessageData md;
	
	@GetMapping("/conversations")
	public String loadConversations(Model model, HttpSession session) {
		
		List<Integer> unreadlist=new ArrayList<Integer>();
		
		
		int userid = (int) session.getAttribute("id");
		List<Conversation> conversations = convService.getConversationsByUserID(userid);
		
		for(Conversation c:conversations) {
			unreadlist.add(md.CountByConversationIdAndReceiverIdAndUnread(c.getId(), userid));
			System.out.println(c.getId());
			System.out.println(md.CountByConversationIdAndReceiverIdAndUnread(c.getId(), userid));
		}
		model.addAttribute("unreadlist",unreadlist);
		model.addAttribute("conversations", conversations);
		
		return "conversations";
	}
		
	@GetMapping("/showConversation")
	public String showConversation(@RequestParam(value="conversationId",required=false) Integer conversationId,Model model, HttpSession session) {
		int userid=(int) session.getAttribute("id");
		
		Optional<Conversation> conversation=convData.findById(conversationId);
		try {
		
		
		if(session.getAttribute("id")==null) {
			return "login";
		}else if(!(conversation.get().getCreator().getId()==userid || conversation.get().getInterlocutor().getId()==userid )){
			return "login";
		}
		}catch (NullPointerException | NoSuchElementException ex ) {
			//ex.printStackTrace();
			return "login";
		}
		List<Message> messages = convData.findById(conversationId).get().getMessages();
		
		//Get only the unread messages of this specific conversation 
		List<Message> unreadlist=md.findAllByConversationIdAndReceiverId(conversationId, userid);
		//Make   flag unread to read
		for(Message m:unreadlist) {
			m.setUnread(false);
			md.save(m);
		}
		
		
		
		model.addAttribute("list", messages);	
		model.addAttribute("conversationId",conversationId);
		model.addAttribute("conversation",conversation.get());
		model.addAttribute("totalMessages",conversation.get().getMessages().size());
	
		return "MessagesChat";
	}
	
	
	@GetMapping("/showConversation/download")
	public String showConversationDownload(@RequestParam(value="conversationId",required=false) Integer conversationId,Model model, HttpSession session) {
		
		
		Optional<Conversation> conversation=convData.findById(conversationId);
		try {
		int id=(int) session.getAttribute("id");
		
		if(session.getAttribute("id")==null) {
			return "login";
		}else if(!(conversation.get().getCreator().getId()==id || conversation.get().getInterlocutor().getId()==id )){
			return "login";
		}
		}catch (NullPointerException | NoSuchElementException ex ) {
			//ex.printStackTrace();
			return "login";
		}
		List<Message> messages = convData.findById(conversationId).get().getMessages();
		
		model.addAttribute("list", messages);	
		model.addAttribute("conversationId",conversationId);
	
		return "MessagesDownload";
	}
	
	
	
	

}	

