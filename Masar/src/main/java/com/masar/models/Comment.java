package com.masar.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Size;

@Entity
@Table(name="comments")
public class Comment {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
	@Size(min=10 , max= 700)
    private String text;
    
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
	@JoinColumn(name="commentUser_id")
	private User commentUser;
	 
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="commentTrail_id")
	private Trail commentTrail;

	public Comment() {
	}
	public Comment(String text) {
		this.text = text;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
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
	public User getCommentUser() {
		return commentUser;
	}
	public void setCommentUser(User commentUser) {
		this.commentUser = commentUser;
	}
	public Trail getCommentTrail() {
		return commentTrail;
	}
	public void setCommentTrail(Trail commentTrail) {
		this.commentTrail = commentTrail;
	}
	
	
	
}
