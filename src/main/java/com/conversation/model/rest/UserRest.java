package com.conversation.model.rest;

import com.fasterxml.jackson.annotation.JsonProperty;

public class UserRest {
	
	private int id;
	private String username;
	
	//@JsonProperty("firstname")
	private String firstName;
	
	//@JsonProperty("lastname")
	private String lastName;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
}
