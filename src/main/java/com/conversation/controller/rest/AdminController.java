package com.conversation.controller.rest;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.conversation.model.Message;
import com.conversation.model.Partner;
import com.conversation.model.User;
import com.conversation.model.rest.MessageObject;
import com.conversation.repository.MessageData;
import com.conversation.repository.PartnerData;
import com.conversation.repository.UserData;

@RestController
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	MessageData md;

	@Autowired
	UserData ud;
	
	@Autowired
	PartnerData pd;
	
	
	@ResponseBody
	@RequestMapping(value = "/foos1", method = RequestMethod.GET)
	public Optional<Message> findAll(@RequestParam(value = "id", defaultValue = "0") int id) {
			return md.findById(id);
			
	}
	
	@ResponseBody
	@RequestMapping(value = "/foos", method = RequestMethod.GET)
	public List<Message> findAll() {
		List<Message> list= md.findAll();
		for(Message l:list) {
			l.setReceiver(null);
		}
		return list;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/foos123", method = RequestMethod.GET)
	public List<MessageObject> findAlla(HttpSession session) {
		System.out.println(session.getCreationTime());
		List<MessageObject> m=new ArrayList<MessageObject>();
		List<Message> l=md.findAll();
		
		for(Message msg:l) {
			MessageObject msgo=new MessageObject();
			msgo.setId(msg.getId());
			msgo.setReceiver(msg.getReceiver().getUsername());
			msgo.setSender(msg.getSender().getUsername());
			m.add(msgo);
			
		}
		return m;
	}
	
	
	
	
	@ResponseBody
	@RequestMapping(value = "/foos2", method = RequestMethod.GET)
	public List<Message> findAllPagination(Pageable pageable) {
		Page<Message> pages=md.findAll(pageable);
		return pages.getContent();
	}
	
	@ResponseBody
	@RequestMapping(value = "/foos3", method = RequestMethod.GET)
	public Page<Message> findAllPagination2(Pageable pageable) {
		Page<Message> pages=md.findAll(pageable);
		return pages;
	}
	
	
	@RequestMapping("/users")
	public @ResponseBody List<Message> user(@RequestParam(value = "name", defaultValue = "World") String name) {
		List<Message> list = md.findAll();
		return list;
	}

	
	
	
	@RequestMapping("/admin")
	public String admin() {
		String password = "123456";
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String hashedPassword = passwordEncoder.encode(password);
		System.out.println(hashedPassword);
		
		//User john=ud.findById(2);
		//System.out.println(passwordEncoder.matches(password, john.getPassword()));
		
		
		Partner p = new Partner();
		p.setUsername("123sadas12323s");
		p.setPassword("huhu");
		pd.save(p);
		
		
		return "/thanasis/admin";
	}

	@ResponseBody
	@RequestMapping(value = "/foos", method = RequestMethod.POST)
	public String saveMessage() {
		return "asdF";
	}
	
	
	@RequestMapping(value="/add", method = RequestMethod.POST, headers="Accept=application/json")
	 public ResponseEntity<User> add(@RequestBody User user){
		System.out.println("asdad");
	  ud.save(user);
	  
	  HttpHeaders headers = new HttpHeaders();
	
	  return new ResponseEntity<User>(headers, HttpStatus.CREATED);
	 }
	
	
	//gia na epistrefw custom json me polla dedomena
	@ResponseBody
	@RequestMapping(value="/asdf", method = RequestMethod.GET)
	public  Map<String, Object> asd() {
	Map<String, Object> test = new HashMap<String, Object>();
	    Map<String, Boolean> custom = new HashMap<>();
	    User user =new User();
	    custom.put("hasVoted", true);
	    custom.put("hasCommented", false);
	    test.put("user", user);
	    test.put("custom", custom);
	    return test;
	}
	
	
	
	
//
//	@RequestMapping(value = "/update-message/{id}", method = RequestMethod.PUT)
//	public ResponseEntity<Void> updateCar(@PathVariable("id") int id, @RequestBody Message message) {
//
//		try {
//			md.save(message);
//			return ResponseEntity.status(HttpStatus.OK).build();
//		} catch (Exception e) {
//			e.printStackTrace();
//			return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
//		}
//	}





//	@RequestMapping(value = "/json", method = RequestMethod.GET, produces = "application/json")
//	public ResponseEntity<String> bar() {
//
//		List<Message> list = md.findAll();
//
//		final HttpHeaders httpHeaders = new HttpHeaders();
//		httpHeaders.setContentType(MediaType.APPLICATION_JSON);
//		return new ResponseEntity<String>(list.toString(), httpHeaders, HttpStatus.OK);
//
//	}
}
