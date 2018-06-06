package com.conversation.controller;

import java.io.File;
import java.net.URL;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.dom4j.CDATA;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.conversation.model.Category;
import com.conversation.model.Partner;
import com.conversation.model.User;
import com.conversation.repository.CategoryData;
import com.conversation.repository.PartnerData;
import com.conversation.repository.UserData;
import com.conversation.service.UserService;

@Controller

public class HomeController {
	
	
	@Autowired
	UserService userService;
	
	@Autowired
	UserData userData;

	@Autowired
	PartnerData pd;
	
	@Autowired
	CategoryData cd;
	

	@RequestMapping("/login")
	public String login(Model model,HttpSession session) {
		
		
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
	

	
	@GetMapping("/registration")
	public String profilePartners(Model model) {
		
		ArrayList<Category> categories = cd.findAll();
		model.addAttribute("categories",categories);
		
		return "registration-partner";
		
	}
	
	
	@PostMapping("/registration/submit")
	public String formsubmit(
			@RequestParam("username")String username, 
			@RequestParam("password")String password,
			@RequestParam("email")String email,
			@RequestParam("firstname")String firstName,
			@RequestParam("type")String role,
			@RequestParam("lastname")String lastName,
			@RequestParam(value="category",required=false)Integer id,
			@RequestParam(value="description",required=false)String description,
			Pageable pageable,Model model,HttpSession session,RedirectAttributes rm) {
		
		System.out.println(username);
		System.out.println(email);
		System.out.println(password);
		System.out.println(firstName);
		System.out.println(role);
		
		
		boolean usernameflag=userData.existsByUsername(username);
		boolean emailflag=userData.existsByEmail(email);
		
		if(!usernameflag && !emailflag)  {
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String hashedPassword = passwordEncoder.encode(password);
		
			if (role.equals("partner")) {
				Partner p = new Partner();
				p.setPassword(hashedPassword);
				p.setRole(role);
				p.setUsername(username);
				p.setFirstName(firstName);
				p.setLastName(lastName);
				p.setEmail(email);
				p.setCategory(cd.findById(id).get());
				p.setDescription(description);
				pd.save(p);
				System.out.println("PARTNER CREATED");
			} else if (role.equals("user")) {
				User u = new User();
				u.setPassword(hashedPassword);
				u.setRole(role);
				u.setUsername(username);
				u.setFirstName(firstName);
				u.setLastName(lastName);
				u.setEmail(email);
				userData.save(u);
				System.out.println("USER CREATED");
			} else {
				
				rm.addFlashAttribute("error", true);
			}
		}else {
			if(usernameflag==true) {
				rm.addFlashAttribute("usernameError", true);
			}
			if(emailflag==true) {
				rm.addFlashAttribute("emailError", true);
			}
			 return "redirect:/registration";
		}
		rm.addFlashAttribute("registerSuccess", true);
		return "redirect:/login";
	}
	
	@RequestMapping("/home")
	public String home() {
		URL url = this.getClass().getClassLoader().getResource("static");
		System.out.println(url);
		return "index";
	}
	
	@RequestMapping("/about")
	public String about() {
		
		return "about";
	}

	@RequestMapping("/services-site")
	public String servicesHome() {
		return "services";
	}
	
	@RequestMapping("/administrator")
	public String administrator() {
		
		return "administrator";
	}

}
