package com.conversation.repository;

import java.util.List;

import com.conversation.model.User;

public interface UserRepository {
	public User getUserByUsername(String username);
	public boolean checkUsernamePassword(String username, String password);
	public List<User> getUsers();
	public Integer getUserId(String username);
	public void saveUser(User user);
	public User getUser(int id);
	public void deleteUser(int id);
	public boolean checkIfUsernameExists(String username);
	public boolean checkIfEmailExists(String email);

	
	
	

}
