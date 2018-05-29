package com.conversation.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.conversation.model.Conversation;
import com.conversation.model.Message;
import com.conversation.model.User;
import com.conversation.repository.ConversationData;
import com.conversation.repository.UserData;
import com.conversation.service.ConversationService;
import com.conversation.service.UserService;

@Controller

public class HomeController {
	
	
	
	@Autowired
	UserService userService;
	
	@Autowired
	UserData userData;

	
	@RequestMapping("/login")
	public String log(Model model) {

		return "login";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session,Model model) {
		session.invalidate();
		return "redirect:/users1";
	}

	
	@PostMapping("/validation")
	public String loginValidation(@RequestParam ("username") String username, @RequestParam("pwd") String password, HttpSession session,Model model) {

		if (userData.existsByUsername(username)) {
			User u = userData.findByUsername(username);
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

			if (passwordEncoder.matches(password, u.getPassword())) {
				session.setAttribute("id", u.getId());
				session.setAttribute("username", u.getUsername());
				session.setAttribute("loggedin", true);
				return "redirect:/users1";
			} else {
				model.addAttribute("passwordError", true);
				return "login";
			}

		} else {
			model.addAttribute("usernameError", true);
			return "login";
		}

	}
	
	//old way of validation without encryption -Stam
	@PostMapping("/userCheck")
	public String login(@RequestParam ("username") String username, @RequestParam("pwd") String password, HttpSession session,Model model) {
		
	
		if (userService.loginUser(username, password)) {
			session.setAttribute("id", userService.getUserId(username));
			session.setAttribute("username", userData.findByUsername(username));
			session.setAttribute("loggedin",true);
			return "redirect:/messagesChat";
			
		}
		else {
		
		return "login";
		}
	
	
	}
	
	
	
	
}
