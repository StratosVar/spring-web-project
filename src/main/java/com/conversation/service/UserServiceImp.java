package com.conversation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.conversation.repository.UserRepository;
import com.conversation.model.User;


@Service
public class UserServiceImp implements UserService {


	@Autowired
	private UserRepository userRepository;
	
	
	@Override
	@Transactional
	public List<User> getUsers() {
		
		return userRepository.getUsers();
	}

	

	
	
	@Override
	@Transactional
	public User getUserByUsername(String username) {	
		return userRepository.getUserByUsername(username);
	}

	@Override
	@Transactional
	public void deleteUser(int id) {	
		userRepository.deleteUser(id);
	}
	
	@Override
	@Transactional
	public User getUser(int id) {	
		return userRepository.getUser(id);
	}
	
	@Override
	@Transactional
	public void saveUser(User user) {	
		userRepository.saveUser(user);
	}
	
//	@Override
//	@Transactional
//	public boolean loginUser1(String username, String pwd) {
//
//		User user = getUserByUsername(username);
//		System.out.println(user);
//		if (!(user==null)) {
//			if (user.getPassword().equals(pwd)) {
//				return true;
//			} else {
//				return false;
//			}
//		}
//		return false;
//		
//	}
	
	
	@Override
	@Transactional
	public boolean loginUser(String username, String password) {

		return userRepository.checkUsernamePassword(username, password);
		
	}
	


	@Override
	@Transactional
	public Integer getUserId(String username) {	
		return userRepository.getUserId(username);
	}


}





