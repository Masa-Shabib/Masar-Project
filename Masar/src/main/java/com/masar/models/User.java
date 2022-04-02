package com.masar.models;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.Size;

@Entity
@Table(name="users")
public class User {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Size(min=3)
    private String username;
    
    
	@Email
	@Size(min=1)
	private String email;

    
    @Size(min=5)
    private String password;
    
    @Transient
    private String passwordConfirmation;
    
    @Column(updatable=false)
    private Date createdAt;
    private Date updatedAt;
    
    @OneToMany(mappedBy = "admin", fetch = FetchType.LAZY)
    private List<Trail> trails;
    
    @OneToMany(mappedBy = "client", fetch = FetchType.LAZY)
    private List<BusinessTrail> businessTrails;
    
    @OneToMany(mappedBy = "commentUser",cascade=CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Comment> userComments;
    
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "guests_trails", 
        joinColumns = @JoinColumn(name = "guest_id"), 
        inverseJoinColumns = @JoinColumn(name = "bTrail_id"))
    private List<BusinessTrail> joinedTrails;
    
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
        name = "users_roles", 
        joinColumns = @JoinColumn(name = "user_id"), 
        inverseJoinColumns = @JoinColumn(name = "role_id"))
    private List<Role> roles;
    
    public User() {
    }
    
	public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getPasswordConfirmation() {
        return passwordConfirmation;
    }
    public void setPasswordConfirmation(String passwordConfirmation) {
        this.passwordConfirmation = passwordConfirmation;
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
    public List<Role> getRoles() {
        return roles;
    }
    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }
    
    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public List<Trail> getTrails() {
		return trails;
	}

	public void setTrails(List<Trail> trails) {
		this.trails = trails;
	}

	public List<BusinessTrail> getBusinessTrails() {
		return businessTrails;
	}

	public void setBusinessTrails(List<BusinessTrail> businessTrails) {
		this.businessTrails = businessTrails;
	}

	public List<Comment> getUserComments() {
		return userComments;
	}

	public void setUserComments(List<Comment> userComments) {
		this.userComments = userComments;
	}

	public List<BusinessTrail> getJoinedTrails() {
		return joinedTrails;
	}

	public void setJoinedTrails(List<BusinessTrail> joinedTrails) {
		this.joinedTrails = joinedTrails;
	}
    
    
}