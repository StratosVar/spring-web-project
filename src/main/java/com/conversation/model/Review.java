package com.conversation.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name= "review")
public class Review {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	@NotNull
	private int id;
	
	@Column(name = "review")
	private String review;
	
	@Column(name = "points")
	private double points;
	

	@OneToOne( cascade = CascadeType.ALL)
	@JoinColumn(name="reviewer_id",nullable = false)
	private User reviewer;

	
	
	@ManyToOne
	@JoinColumn(name = "partner_id")
	private Partner partner;
	

	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getReview() {
		return review;
	}


	public void setReview(String review) {
		this.review = review;
	}


	public double getPoints() {
		return points;
	}


	public void setPoints(double points) {
		this.points = points;
	}


	public User getReviewer() {
		return reviewer;
	}


	public void setReviewer(User reviewer) {
		this.reviewer = reviewer;
	}


	public Partner getPartner() {
		return partner;
	}


	public void setPartner(Partner partner) {
		this.partner = partner;
	}

	
	
	
	
	
	
	
}
