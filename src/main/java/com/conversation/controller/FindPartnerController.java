package com.conversation.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.conversation.model.Category;
import com.conversation.model.Partner;
import com.conversation.repository.CategoryData;
import com.conversation.repository.ConversationData;
import com.conversation.repository.PartnerData;


@Controller
public class FindPartnerController {
	
	@Autowired
	PartnerData pd;
	
	@Autowired
	ConversationData convData;
	
	@Autowired
	CategoryData cd;
	
	
	@GetMapping("/users1")
	public String findPartner(Pageable pageable,Model model) {
		//pd.findAll();
		Page<Partner> page=pd.findAll(pageable);
		System.out.println(page.getNumberOfElements());
		System.out.println(page.getTotalPages());
		model.addAttribute("list",page.getContent());
		
		model.addAttribute("totalpages", page.getTotalPages());
		model.addAttribute("totalresults", page.getTotalElements());
		/*Model for categories select list*/
		ArrayList<Category> categories = cd.findAll();
		model.addAttribute("categories",categories);
		
		return "search-users";
	}
	
	@GetMapping("/usersResults")
	public String findPartnerResults(@RequestParam(name = "star", defaultValue = "0") Double star,
			@RequestParam(name = "category", defaultValue = "0",required = false) Integer id,
			@RequestParam(name = "keyword", defaultValue = "NOVALUE") String keyword, Pageable pageable, Model model) {
		//pd.findAll();//need this because of silly bug fr native query
		
		
		
		
		Page<Partner> list=pd.findAll(pageable);
		try {
			System.out.println(star);
			System.out.println(keyword);
			System.out.println(id);
			System.out.println(pageable.toString());

			if (id != 0 && star != 0 && !keyword.equals("NOVALUE")) {
				list = pd.findAllByDescriptionContainingAndCategoryIdAndTotalpointsGreaterThanEqual(keyword, id, star,
						pageable);
				System.out.println("First query");

			} else if (id != 0 && star != 0 && keyword.equals("NOVALUE")) {
				list = pd.findAllByCategoryIdAndTotalpointsGreaterThanEqual(id, star, pageable);
				System.out.println("Second query");
			} else if (id != 0 && star == 0 && !keyword.equals("NOVALUE")) {
				list = pd.findAllByCategoryIdAndDescriptionContaining(id, keyword, pageable);
				System.out.println("Third query");
			} else if (id != 0 && star == 0 && keyword.equals("NOVALUE")) {
				list = pd.findAllByCategoryId(id, pageable);
				System.out.println("Fourth query");
			} else if (id == 0 && star != 0 && keyword.equals("NOVALUE")) {
				list = pd.findAllByTotalpointsGreaterThanEqual(star, pageable);
				System.out.println("Fifth query");
			} else {
				list = pd.findAllByCategoryIdNotOrDescriptionContainingOrTotalpointsGreaterThanEqual(id, keyword,
						star, pageable);
				System.out.println("Sixth query");
			}

		System.out.println(list.getSize()); //was .size before pagination
															
		model.addAttribute("list", list.getContent());
		model.addAttribute("totalpages", list.getTotalPages());
		model.addAttribute("lastpage", list.getTotalPages());
		model.addAttribute("totalresults", list.getTotalElements());
		if(list.getSize()==0) { //was .size before pagination
			model.addAttribute("error", true);
		}
		}catch (NullPointerException e) {
			model.addAttribute("error", true);
		}
		
		
		/*Model for categories select list*/
		ArrayList<Category> categories = cd.findAll();
		model.addAttribute("categories",categories);
		
		int perpage = pageable.getPageSize();
		model.addAttribute("star",star);
		model.addAttribute("keyword", keyword);
		model.addAttribute("category",id);
		model.addAttribute("perpage",perpage);
		
		System.out.println(star);
		
		return "search-users";
	}
	
	

	
}


