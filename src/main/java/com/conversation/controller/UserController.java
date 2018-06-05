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
import org.springframework.web.bind.annotation.RequestParam;

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
		
	@RequestMapping("/profile")
	public String userprofile(HttpSession session, Model model) {

		String username = (String) session.getAttribute("username");
		User u = ud.findByUsername(username);

		model.addAttribute("user", u);
		return "profile";

	}

	
	@PostMapping("/saveUser")
	public String userProfileSave(@ModelAttribute("user") User user, @RequestParam(value="password",defaultValue="0")String password,HttpSession session) { 
		//@ModelAttribute("user") User user must go first or else null pointer exception
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
		User u = ud.findById(user.getId());	
		String thepassword = u.getPassword();
		
		
		if (!password.equals("0")) {
			String hashedPassword = passwordEncoder.encode(password);
			user.setPassword(hashedPassword);
			thepassword = hashedPassword;
		} else if (password.equals("0")) {
			user.setPassword(thepassword);
		}
		
		
		
		
		System.out.println("The passwords 1) user database,2 form jstl,3 if not 0");
		System.out.println(u.getPassword());
		System.out.println(user.getPassword());
		System.out.println(password);
		System.out.println(passwordEncoder.matches(user.getPassword(), u.getPassword()));

		if (u.getRole().equals("partner")) {
			Optional<Partner> p = pd.findById(user.getId());
			p.get().setEmail(user.getEmail());
			p.get().setFirstName(user.getFirstName());
			p.get().setLastName(user.getLastName());
			p.get().setUsername(user.getUsername());
			p.get().setPassword(thepassword);
			pd.save(p.get());
		} else {
			user.setRole(u.getRole()); // edw tha mpei gia ton is admin i oxi
			
			ud.save(user);
		}
		
		return "redirect:/logout";
		
	}
	
	
	
}
	


	
