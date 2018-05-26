package com.conversation.model;


import java.util.Date;
import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

@Entity
@Table(name="message")
public class Message {
	
	public Message() {}

	
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	@NotNull
	private int id;
	
	@ManyToOne
	@JoinColumn(name="sender_id",nullable = false)
	private User sender;
	
	@ManyToOne
	@JoinColumn(name="receiver_id",nullable = false)
	private User receiver;
	
	@Temporal(TemporalType.TIMESTAMP) //paizei mono me date
	@Column(name = "date_time")
	private Date dateTime;
	
	@Column(name = "unread")
	private boolean unread;
	
	@Column(name = "text")
	private String text;

	
//	@ManyToOne(fetch=FetchType.EAGER,cascade = CascadeType.ALL)
//	private Conversation conversation;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getSender() {
		return sender;
	}

	public void setSender(User sender) {
		this.sender = sender;
	}

	public User getReceiver() {
		return receiver;
	}

	public void setReceiver(User receiver) {
		this.receiver = receiver;
	}

	public Date getDateTime() {
		return dateTime;
	}

	public void setDateTime(Date dateTime) {
		this.dateTime = dateTime;
	}

	public boolean isUnread() {
		return unread;
	}

	public void setUnread(boolean unread) {
		this.unread = unread;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}



	
	
	
}
