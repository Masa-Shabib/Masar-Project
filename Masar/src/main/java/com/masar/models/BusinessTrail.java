package com.masar.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Size;

@Entity
@Table(name="businesstrails")
public class BusinessTrail {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Size(min=3)
    private String name;
    
    @Size(min=1)
    private String category;
    
    @Size(min=10)
    private String description;
    
    @Size(min=10)
    private double price;
    
    @Size(min=1)
    private Long relatedTrail;
    
    @Column(updatable=false)
    private Date createdAt;
    private Date updatedAt;
    
    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "client_id")
    private User client;
    
    
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "guests_trails", 
        joinColumns = @JoinColumn(name = " bTrail_id"), 
        inverseJoinColumns = @JoinColumn(name = "guest_id"))
    private List<User> joinedGuests;

	public BusinessTrail() {
	}
	public BusinessTrail(@Size(min = 3) String name, @Size(min = 1) String category, @Size(min = 10) String description,
			@Size(min = 10) double price, @Size(min = 1) Long relatedTrail) {
		this.name = name;
		this.category = category;
		this.description = description;
		this.price = price;
		this.relatedTrail = relatedTrail;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public Long getRelatedTrail() {
		return relatedTrail;
	}
	public void setRelatedTrail(Long relatedTrail) {
		this.relatedTrail = relatedTrail;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	public User getClient() {
		return client;
	}
	public void setClient(User client) {
		this.client = client;
	}
	public List<User> getJoinedGuests() {
		return joinedGuests;
	}
	public void setJoinedGuests(List<User> joinedGuests) {
		this.joinedGuests = joinedGuests;
	}
    
	
    
    
}
