package com.conversation.controller;

import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.conversation.model.Partner;
import com.conversation.model.User;
import com.conversation.repository.PartnerData;
import com.conversation.repository.UserData;



@Controller
public class UserController {
	
	@Autowired
	UserData ud;
	
	@Autowired
	PartnerData pd;
		
	
	@RequestMapping("/form")
	public String form() {

		return "old/form";
		
	}
	
	@RequestMapping("/profile")
	public String userprofile(HttpSession session,Model model) {
		
		String username=(String) session.getAttribute("username");
		User u = ud.findByUsername(username);
		
		model.addAttribute("user",u);
		return "Profile";
		
	}

	
	@PostMapping("/saveUser")
	public String userProfileSave(@ModelAttribute("user") User user,HttpSession session) { //@ModelAttribute("user") User user must go first or else null pointer exception
		User u=ud.findById(user.getId());
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
		
		if(!passwordEncoder.matches(user.getPassword(), u.getPassword())) {
			String hashedPassword = passwordEncoder.encode(user.getPassword());
			user.setPassword(hashedPassword);
			}
		
		System.out.println(passwordEncoder.matches(user.getPassword(), u.getPassword()));
		
		
		if(u.getRole().equals("partner")) {
			Optional<Partner> p=pd.findById(user.getId());
			p.get().setEmail(user.getEmail());
			p.get().setFirstName(user.getFirstName());
			p.get().setLastName(user.getLastName());
			p.get().setUsername(user.getUsername());	
			p.get().setPassword(user.getPassword());
			pd.save(p.get());
		}else {
			ud.save(user);
		}
		
		
		//user.setPassword(u.getPassword()); //hiding password from form <form:hidden path="password" />
	
		
		return "redirect:/logout";
		
	}
	
	
	
}
	


	
