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
	
	
	@GetMapping("/users1")
	public String findPartner(Pageable pageable,Model model) {
		pd.findAll();
		Page<Partner> page=pd.findAll(pageable);
		model.addAttribute("list",page.getContent());
		return "SearchUsers";
	}
	
	@GetMapping("/usersResults")
	public String findPartnerResults(@RequestParam(name = "star", defaultValue = "1") Double star,
			@RequestParam(name = "category", required = false, defaultValue = "0") Integer id,
			@RequestParam(name = "keyword", defaultValue = "NOVALUE") String keyword, Pageable pageable, Model model) {
		pd.findAll();//need this because of silly bug
		
		
		try {
		List<Partner> list=pd.findAllByCategoryIdOrDescriptionContaining(id, keyword,pageable);
		
		Iterator<Partner> ip = list.iterator();
		while (ip.hasNext()) {
			Partner p=null;
			List<Review> l = ip.next().getReviews();
			double points = 0;
			for (Review r : l) {
				points += r.getPoints();
				System.out.println(points);
				//r.getPartner().setTotalPoints(points);
				p=r.getPartner();
			}
			
			if(p!=null) {
			p.setTotalPoints(points);
			}
			
			double d=(double)l.size();
															System.out.println(d);
															System.out.println(points/d);
			if (points/d < star) {
				ip.remove();
			}
			

		} // end while
		
		
																System.out.println(list.size());
		model.addAttribute("list", list);
		if(list.size()==0) {
			model.addAttribute("error", true);
		}
		}catch (NullPointerException e) {
			model.addAttribute("error", true);
		}
		return "SearchUsers";
	}
	
	

	
}


