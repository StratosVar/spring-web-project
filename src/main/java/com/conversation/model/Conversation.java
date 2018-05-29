package com.conversation.model;

import java.util.ArrayList;

import java.util.List;


import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderColumn;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.OrderBy;
import org.hibernate.annotations.SortNatural;

import com.conversation.model.Message;

@Entity
@Table(name= "conversation")
public class Conversation {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	@NotNull
	private int id;
	
	@Column(name= "title")
	private String title;
	
	@ManyToOne
	@JoinColumn(name="creator_id")
	private User creator;
	
	@ManyToOne
	@JoinColumn(name="interlocutor_id")
	private User interlocutor;
	
	@OneToMany(fetch = FetchType.LAZY,cascade=CascadeType.ALL)  //mappedBy="conversation"
	@SortNatural
	@OrderColumn(name = "id")
	private List<Message> messages= new ArrayList<>();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public User getCreator() {
		return creator;
	}

	public void setCreator(User creator) {
		this.creator = creator;
	}

	public List<Message> getMessages() {
		return messages;
	}

	public void setMessages(List<Message> messages) {
		this.messages = messages;
	}

	public User getInterlocutor() {
		return interlocutor;
	}

	public void setInterlocutor(User interlocutor) {
		this.interlocutor = interlocutor;
	}

	
	
	
	
	
	

}
