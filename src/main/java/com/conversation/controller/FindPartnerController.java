package com.conversation.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.conversation.model.Conversation;
import com.conversation.model.Message;
import com.conversation.model.Partner;
import com.conversation.model.Review;
import com.conversation.repository.ConversationData;
import com.conversation.repository.PartnerData;


@Controller
public class FindPartnerController {
	
	@Autowired
	PartnerData pd;
	
	@Autowired
	ConversationData convData;
	
	
	
	@GetMapping("/profile/partner/{id}")
	public String profilePartner(@PathParam(value = "id")Integer id, Pageable pageable,Model model) {
		pd.findAll();
		Page<Partner> page=pd.findAll(pageable);
		model.addAttribute("list",page.getContent());
		return "profilePartner";
	}
	
	
	@GetMapping("/users1")
	public String findPartner(Pageable pageable,Model model) {
		pd.findAll();
		Page<Partner> page=pd.findAll(pageable);
		model.addAttribute("list",page.getContent());
		return "SearchUsers";
	}
	

	
	
	
	@GetMapping("/usersResults")
	public String findPartnerResults(@RequestParam(name = "star", defaultValue="1") Double star,@RequestParam("category") int id,@RequestParam(name = "keyword",defaultValue="NOVALUE") String keyword,
			Pageable pageable) {
		pd.findAll();
		System.out.println(id);
		List<Partner> list=pd.findAllByCategoryIdOrDescriptionContaining(id, keyword,pageable);
		Iterator<Partner> ip = list.iterator();
		while (ip.hasNext()) {

			List<Review> l = ip.next().getReviews();
			double points = 0;
			for (Review r : l) {
				points += r.getPoints();
				System.out.println(points);
			}
			double d=(double)l.size();
															System.out.println(d);
															System.out.println(points/d);
			if (points/d < star) {
				ip.remove();
			}
			

		} // end while

																System.out.println(list.size());
		
		return "SearchUsers";
	}
	
	
	@GetMapping("/messagesChat")
	public String showConversation(Model model, HttpSession session) {
		String name="thanasis";
		session.setAttribute("username", name);
		
		List<Message> messages = convData.findById(1).getMessages();
		System.out.println(messages);
		System.out.println(messages.get(1).getText());
		messages.get(1).getSender().getUsername();
		model.addAttribute("list", messages);
		
		
		return "messagesChat";
	}
	
	
}







//Page<Message> pages=messageRep.findAllByConversation(pageable,c.get());
//
//System.out.println(pages.getNumber()); 
//System.out.println(pages.getTotalPages());
//System.out.println(pages.getTotalElements());
//System.out.println(messageRep.findAll());	
//
//model.addAttribute("messages",pages.getContent());
//
//


