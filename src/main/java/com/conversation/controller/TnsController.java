package com.conversation.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.conversation.model.Conversation;
import com.conversation.model.Message;
import com.conversation.model.Partner;
import com.conversation.model.Review;
import com.conversation.model.User;
import com.conversation.repository.ConversationData;
import com.conversation.repository.PartnerData;
import com.conversation.service.ConversationService;
import com.conversation.service.UserService;

@Controller
public class TnsController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	ConversationService convService;
	
	@Autowired
	ConversationData convData;
	
	@Autowired
	PartnerData pd;
	//SXOLIO
	
	
	@PostMapping("/")
    public String checkPersonInfo(@Valid User userForm, BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            return "form";
        }

        return "redirect:/results";
    }
	
	@GetMapping("/h")
    public String login(HttpSession session,Model model) {
		List<Partner> a = pd.findAll();
		model.addAttribute("list",a);
		model.addAttribute("total",pd.findAll().size());
		
		
		Partner p=new Partner();
		p.setPassword("Asdadd");
		p.setUsername("asdaasjdd");
		//pd.save(p);
		Review r=new Review();
		r.setReviewer(p);
		p.getReviews().add(r);
		//pd.save(p);
        return "profile";
    }
	
	
	
	@RequestMapping("/add")
    public String review(HttpSession session,Model model) {
	
		
        return "SearchUsers";
    }
	

	@GetMapping("/addForm")
    public String reviewSubmit(@RequestParam("text")String review,HttpSession session,Model model) {
	
		
        return "home1";
    }
	
	
	
	
	@RequestMapping("/conversation")
    public String conv(HttpSession session,Model model) {
		String s=(String) session.getAttribute("username");
		
		model.addAttribute("list",convData.findAllByCreator(userService.getUser(3)));
        return "/thanasis/conversations1";
    }
	
	@RequestMapping("/messages/{id}")
    public String messages(HttpSession session,Model model,@PathParam("id")Integer id) {
		String s=(String) session.getAttribute("username");
		
		Conversation c=convData.findById(1);
		
		model.addAttribute("list",c.getMessages());
        return "messages1";
    }
	
	
	
	
	@GetMapping("/login1")
    public String login(@RequestParam("username")String s,HttpSession session) {
		session.setAttribute("username", s);

        return "redirect:/h";
    }
	
	
	@PostMapping("/send")
    public String send(@RequestParam("username")String s,HttpSession session) {
        return "conversations";
    }
	
	@PostMapping("/messages")
    public String messages(@RequestParam("username")String s,HttpSession session) {
		
        return "messages2";
    }
	
	
	@RequestMapping("/search_partners")
    public String asdf(@Valid User userForm, BindingResult bindingResult) {

        Partner p=new Partner();
        p.setPassword("Asdasd");
        p.setUsername("username");
        User u = new User();
        u.setPassword("asdadsa");
        u.setUsername("asdada");
        Review r=new Review();
        pd.save(p);
        r.setPoints(5);
        r.setReviewer(u);
        p.getReviews().add(r);
        pd.save(p);
        

        return "redirect:/admin.html";
    }
	
	
	
	
	
	
}
	
	
	
	
//	@RequestMapping("/")
//	public String home(Model model) {
//		User user=new User();
//		model.addAttribute(user);
//		user.setUsername("thanasis");
//		
//	Conversation conv=convData.findById(1);
//		System.out.println(conv.getId());
//		
//		//Conversation conv1=convData.findByTitle("malakas"); DUPLICATE DEN KANE RETURN UNIQUE
//		//System.out.println(conv1.getId());
//		
//		List<Conversation> conv2=convData.findAllByTitle("malakas");
//		for(Conversation c:conv2) {
//			System.out.println(c.getId());
//		}
//		
//		return "home";
//	}
//		
//		@RequestMapping("/messages")
//		public String messages(Model model,Pageable page) {
//			
//			List<Conversation> list=(List<Conversation>) convData.findAll();
//			System.out.println(list.get(1));
//			model.addAttribute("list",list);
//			
//			
//
//			
//		
//			return "messages";
//		}

		
		

	
	
//	@GetMapping 
//	is a composed annotation that acts as a shortcut for
//	@RequestMapping(method = RequestMethod.GET).

	
