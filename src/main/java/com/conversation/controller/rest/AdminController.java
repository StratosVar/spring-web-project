package com.conversation.controller.rest;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.conversation.model.Message;
import com.conversation.model.Partner;
import com.conversation.model.User;
import com.conversation.model.rest.MessageRest;
import com.conversation.model.rest.UserRest;
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
	


	@CrossOrigin
	@RequestMapping(value = "/messages", method = RequestMethod.GET,headers="Accept=application/json")
	public ResponseEntity<List<MessageRest>> findAlla(HttpSession session) {
		if (session.getAttribute("isadmin") == null) {
			return new ResponseEntity<List<MessageRest>>(HttpStatus.FORBIDDEN) ;
		}
		
		System.out.println(session.getCreationTime());
		List<MessageRest> m=new ArrayList<MessageRest>();
		List<Message> l=md.findAll();
		
//		for(Message msg:l) {
//			MessageRest msgo=new MessageRest();
//			msgo.setId(msg.getId());
//			msgo.setReceiver(msg.getReceiver().getUsername());
//			msgo.setSender(msg.getSender().getUsername());
//			msgo.setText(msg.getText());
//			m.add(msgo);
//			
//		}
		
//		with lamda-streams
		l.forEach(message->{
			MessageRest msgo=new MessageRest();
			msgo.setId(message.getId());
			msgo.setReceiver(message.getReceiver().getUsername());
			msgo.setSender(message.getSender().getUsername());
			msgo.setText(message.getText());
			m.add(msgo);
		});
		
		return new ResponseEntity<List<MessageRest>>(m, HttpStatus.OK);
	}
	

	@CrossOrigin
	@RequestMapping("/users")
	public  ResponseEntity<List<UserRest>> userlist(HttpSession session) {
		HttpHeaders headers = new HttpHeaders();
		headers.set("Problem", "problemo");
		
		if (session.getAttribute("isadmin") == null) {
			return new ResponseEntity<List<UserRest>>(headers,HttpStatus.FORBIDDEN) ;
		}
		
		List<UserRest> restlist=new ArrayList<UserRest>();
		
		
		Iterable<User> list=ud.findAll();
		for(User u:list) {
			UserRest user=new UserRest();
			user.setId(u.getId());
			user.setUsername(u.getUsername());
			user.setFirstName(u.getFirstName());
			user.setLastName(u.getLastName());
			user.setRole(u.getRole());
			user.setEmail(u.getEmail());
			
			if(u.getIsadmin()==true) {
				user.setIsadmin("true");
			}else {
				user.setIsadmin("false");
			}
			
			restlist.add(user);
		}
		
		return new ResponseEntity<List<UserRest>>(restlist, HttpStatus.OK);
	}

	
	
	
	@RequestMapping("/admin123")
	public String admin() {
		String password = "123456";
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String hashedPassword = passwordEncoder.encode(password);
	
		//System.out.println(passwordEncoder.matches(password, john.getPassword()));		
		return hashedPassword;
	}

	
	
	@RequestMapping(value="/add-user", method = RequestMethod.POST, headers="Accept=application/json",produces = MediaType.TEXT_PLAIN_VALUE)
	 public ResponseEntity<String> add(@RequestBody User user,HttpSession session){	
		HttpHeaders headers = new HttpHeaders();
		headers.set("Header", "header");
		if (session.getAttribute("isadmin") == null) {
			return new ResponseEntity<String>(headers, HttpStatus.FORBIDDEN);
		}
		ud.save(user);

		return new ResponseEntity<String>(headers, HttpStatus.CREATED);
	}

	
	
	@CrossOrigin
	@RequestMapping(value = "/delete-user/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Void> deleteUser(@PathVariable("id") int id,HttpSession session) {
		if(session.getAttribute("isadmin")==null) {
			return new ResponseEntity<Void>(HttpStatus.FORBIDDEN);
		}
		User u=ud.findById(id);
		try {
			ud.delete(u);
			return new ResponseEntity<Void>(HttpStatus.OK);
		} catch (Exception ignore) {
			ignore.getMessage();
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
	}
	
	
	@CrossOrigin
	@RequestMapping(value = "/update-user", method = RequestMethod.POST)
	public ResponseEntity<Void>updateUser(@RequestBody UserRest restUser,HttpSession session) {
		if(session.getAttribute("isadmin")==null) {
			return new ResponseEntity<Void>(HttpStatus.FORBIDDEN);
		}
		System.out.println(restUser);
		User u=new User(restUser);
		User udb=ud.findById(u.getId());
		System.out.println(restUser.getRole());
		//u.setProfileimage();
		u.setPassword(udb.getPassword());
		
		if(restUser.getIsadmin().equals("true")) {
			u.setIsadmin(true);
		}else {
			u.setIsadmin(false);
		}

		
		try {
			if(restUser.getRole().equals("partner")) {
				Optional<Partner> p=pd.findById(restUser.getId());
				p.get().setUsername(restUser.getUsername());
				p.get().setFirstName(restUser.getFirstName());
				p.get().setLastName(restUser.getLastName());
				p.get().setIsadmin(u.getIsadmin());
				p.get().setEmail(restUser.getEmail());
				pd.save(p.get());
				}else {
			ud.save(u);
			}
			return new ResponseEntity<Void>(HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
	}
	
	

	@RequestMapping(value = "/json", method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<List<Message>>bar(HttpSession session) {
		if(session.getAttribute("isadmin")==null) {
			return new ResponseEntity<List<Message>>(HttpStatus.FORBIDDEN);
		}

		List<Message> list = md.findAll();
		final HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.setContentType(MediaType.APPLICATION_JSON);
		return new ResponseEntity<List<Message>>(list, httpHeaders, HttpStatus.OK);

	}
	
	
	
	@RequestMapping(value = "/allmessagesusers", method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<Map>allmessages(HttpSession session) {
//		if(session.getAttribute("isadmin")==null) {
//			return new ResponseEntity<Map>(HttpStatus.FORBIDDEN);
//		}

		long totalmessages = md.count();
		long totalusers =ud.count();
		Map map=new HashMap();
		map.put("totalmessages", totalmessages);
		map.put("totalusers", totalusers);
		final HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.setContentType(MediaType.APPLICATION_JSON);
		return new ResponseEntity<Map>(map, httpHeaders, HttpStatus.OK);

	}
	
}
