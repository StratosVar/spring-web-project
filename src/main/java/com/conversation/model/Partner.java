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
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "partner")
@PrimaryKeyJoinColumn(name = "user_id")
public class Partner extends User {
	
	@OneToOne
	@JoinColumn(name="category_id")
	private Category category;
	
	@Column(name = "description")
	private String description;
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy="partner")
	private List<Review> reviews=new ArrayList<Review>();
	
	@Column(name= "total_points")
	private double totalpoints;

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<Review> getReviews() {
		return reviews;
	}

	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
	}
	
	public double getTotalPoints() {
		return totalpoints;
	}

	public void setTotalPoints(double totalPoints) {
		this.totalpoints = totalPoints;
	}

	@Override
	public String toString() {
		return "Partner [Category=" + category + ", description=" + description + ", reviews=" + reviews + "]";
	}
	
	
	
	

}
