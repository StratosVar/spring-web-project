package com.conversation.controller;

import com.conversation.tools.FileAccess;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import com.conversation.model.Conversation;
import com.conversation.model.Message;
import com.conversation.model.User;
import com.conversation.repository.ConversationData;
import com.conversation.service.ConversationService;
import com.conversation.service.UserService;

@Controller
public class MessageController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	ConversationService convService;
	
	@Autowired
	ConversationData convData;
	

		
	@PostMapping("/sendMessage")
	public String sendMessage(Model model, HttpSession session,HttpServletRequest request, @RequestParam(value="conversationId",required=false) Integer conversationId ,
			@RequestParam(value="text",required=false) String text) {
		
	
		
			if (session.getAttribute("id")==null){
			return  "login";
		}	
			
		Message message = new Message();
		System.out.println(session.getAttribute("id")+"this is the id");
		int senderId =(int) session.getAttribute("id");
		User sender = userService.getUser(senderId);
		message.setSender(sender);
		
		int convId =conversationId;
		Conversation conversation = convService.getConversationByID(convId);
		
		if (sender!= conversation.getInterlocutor()) {
			message.setReceiver(conversation.getInterlocutor());
		}
		else {
			message.setReceiver(conversation.getCreator());
		}
	
		message.setText(text);
		
		//To txt file for printing !!
		FileAccess.fileWriterAccess(conversation, message);
		
		
		conversation.getMessages().add(message);
		convService.saveConversation(conversation);
			
		List<Message> messages = conversation.getMessages();
		
		model.addAttribute("list", messages);
		model.addAttribute("conversationId", conversationId);
		
		String url=request.getRequestURL().toString();
		return "redirect:/showConversation?conversationId="+conversationId;
	}
	

}

