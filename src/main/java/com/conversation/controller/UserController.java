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
public class UserController {
	
	@Autowired
	UserService userService;
	

	
	@PostMapping("/userCheck")
	public String login(@RequestParam ("username") String username, @RequestParam("pwd") String password, HttpSession session) {
		
	
		if (userService.loginUser(username, password)) {
			session.setAttribute("id", userService.getUserId(username));
			return "sendToConv";
			
		}
		else {
		return "login";
		}
		
	}

	@RequestMapping("/home")
	public String home() {
		
	
		return "home";
		
		
	}
		
	@RequestMapping("/form")
	public String form() {
		
	
		return "form";
		
		
	}
		
		
	}	
	


	
