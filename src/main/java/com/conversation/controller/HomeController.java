package com.conversation.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.conversation.model.Conversation;
import com.conversation.model.Message;
import com.conversation.model.User;
import com.conversation.repository.ConversationData;
import com.conversation.service.ConversationService;
import com.conversation.service.UserService;

@Controller
public class HomeController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	ConversationService convService;
	
	@Autowired
	ConversationData convData;
	

	@RequestMapping("/login")
	public String log(Model model) {

		
		return "login";
	}
		
		@RequestMapping("/messages")
		public String messages(Model model,Pageable page) {
			
			List<Conversation> list=(List<Conversation>) convData.findAll();
			System.out.println(list.get(1));
			model.addAttribute("list",list);
		
			return "messages";
		}

		
		
	}	
	
	
//	@GetMapping 
//	is a composed annotation that acts as a shortcut for
//	@RequestMapping(method = RequestMethod.GET).

	
