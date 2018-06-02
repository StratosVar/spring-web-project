package com.conversation.controller;

import java.io.File;
import java.net.URL;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.conversation.model.User;
import com.conversation.repository.UserData;
import com.conversation.service.UserService;

@Controller

public class HomeController {
	
	
	
	@Autowired
	UserService userService;
	
	@Autowired
	UserData userData;

	
	@RequestMapping("/login")
	public String login(Model model,HttpSession session) {
		
		
		File directory = new File("conversation_logs"); //testing for images
		System.out.println(directory.getPath());
		if(session.getAttribute("loggedin")!=null) {
			model.addAttribute("login",true);
			session.invalidate();
		}
		return "login";
		
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {

		session.invalidate();

		return "redirect:/login";
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
	public String logincheck(@RequestParam ("username") String username, @RequestParam("pwd") String password, HttpSession session,Model model) {
		
	
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
	
	
	@RequestMapping("/home")
		public String home() {
		URL url = this.getClass().getClassLoader().getResource("static");
		System.out.println(url);
		return "home";
	}

	
	
}
