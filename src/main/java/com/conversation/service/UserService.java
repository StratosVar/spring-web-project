package com.conversation.service;

import java.util.List;

import com.conversation.model.User;

public interface UserService {
	
	public boolean loginUser(String username,String pwd);
	
	public User getUserByUsername(String username) ;

	public List<User> getUsers();

	public void saveUser(User user);

	public User getUser(int id);
	
	public Integer getUserId(String username);

	public void deleteUser(int id);
	

	
	
}
