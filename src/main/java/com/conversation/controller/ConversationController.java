package com.conversation.controller;

import java.util.List;
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
	
	@GetMapping("/conversations")
	public String loadConversations(Model model, HttpSession session) {
		
		int id = (int) session.getAttribute("id");
		List<Conversation> conversations = convService.getConversationsByUserID(id);

		model.addAttribute("conversations", conversations);
		System.out.println(conversations);	
		return "conversations";
	}
		
	@GetMapping("/messagesChat")
	public String showConversation(@RequestParam(value="conversationId",required=false) Integer conversationId,Model model, HttpSession session) {
		String name="thanasis";
		session.setAttribute("username", name);
		int userid=(int) session.getAttribute("id");
		
		String username=(String) session.getAttribute("username");
		
		List<Message> messages = convData.findById(1).getMessages();
		messages.get(1).getSender().getUsername();
		model.addAttribute("list", messages);
		
		model.addAttribute("conversationId",convData.findById(1).getId());
	
		return "MessagesChat";
	}
	
	
	
	
	@GetMapping("/showConversation")
	public String showConversation(Model model, HttpSession session, @RequestParam("conversationId") int conversationId) {
		
		if (session.getAttribute("id")==null){
			return  "login";
		}
		
		Conversation conversation = (Conversation) convService.getConversationByID(conversationId);
		
		List<Message> messages = conversation.getMessages();
		model.addAttribute("messages", messages);
		
		
		return "conversation";
	}
	

}	

