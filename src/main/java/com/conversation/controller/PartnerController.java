package com.conversation.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import com.conversation.model.Conversation;
import com.conversation.model.Message;
import com.conversation.model.Partner;
import com.conversation.model.User;
import com.conversation.repository.ConversationData;
import com.conversation.repository.PartnerData;
import com.conversation.repository.UserData;
import com.conversation.service.ConversationService;
import com.conversation.service.UserService;

@Controller
public class PartnerController {

	@Autowired
	UserService userService;
	
	@Autowired
	UserData userData;
	
	@Autowired
	PartnerData pd;
	
	@Autowired
	ConversationData convData;
	
	
	
	@GetMapping("/partner/registration")
	public String profilePartners(Model model) {
		
		return "registration-partner";
	}
	
	
	@PostMapping("/partner/registration/submit")
	public String formsubmit(@RequestParam("username")String username, @RequestParam("password")String password,
			@RequestParam("email")String email,@RequestParam("phone")Integer phone,
			@RequestParam("firstname")String firstName,@RequestParam("type")String role,
			Pageable pageable,Model model,HttpSession session) {
		
		System.out.println(username);
		System.out.println(email);
		System.out.println(password);
		System.out.println(firstName);
		System.out.println(role);
		System.out.println(phone);
		
		
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String hashedPassword = passwordEncoder.encode(password);
		
		
		if(role.equals("partner")) {
			Partner p=new Partner();
			p.setPassword(hashedPassword);
			p.setRole(role);
			p.setUsername(username);
			pd.save(p);
			System.out.println("PARTNER CREATED");
		}else if(role.equals("user")) {
			User u=new User();
			u.setPassword(hashedPassword);
			u.setRole(role);
			u.setUsername(username);
			userData.save(u);
			System.out.println("USER CREATED");
		}else {
			model.addAttribute("error",true);
		}
		
		return "ProfilePartner";
	}
	
	
	
	@RequestMapping("/partner/profile/{id}")
	public String profilePartner(@PathVariable(value="id")Integer id, Pageable pageable,Model model) {
		System.out.println(id);
		Optional<Partner> p=pd.findById(id);
		model.addAttribute("partner",p.get());
		return "ProfilePartner";
	}
	
	
	@GetMapping("/partner/profile/start/{id}")
	public RedirectView startConversation(@PathVariable(value = "id")Integer id,@RequestParam("title")String title,@RequestParam("text")String text, 
			Pageable pageable,Model model,HttpSession session) {
		
		int userid=(int) session.getAttribute("id");
		
	
		Optional<Partner> p=pd.findById(id);
		User u=userData.findById(userid);
		
		Conversation c=new Conversation();
		c.setInterlocutor(p.get());
		c.setCreator(u);
		c.setTitle(title);
		
		Message m=new Message();
		m.setSender(u);
		m.setReceiver(p.get());
		m.setText(text);
		m.setUnread(true);
		c.getMessages().add(m);
		
		convData.save(c);
		model.addAttribute("uid", c.getId());
		
		
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl("http://127.0.0.1:8080/showConversation?conversationId="+c.getId());
		return redirectView;
	}
	
	
	@GetMapping("/partner/{id}/review")
	public String partnerReview(@PathVariable(value = "id")Integer id, Pageable pageable,Model model) {
		
		return "ProfilePartner";
	}
	
	
	
	
	
	
}

	
