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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.Size;

@Entity
@Table(name="trails")
public class Trail {
	

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Size(min=3)
    private String name;
    
    @Size(min=3)
    private String location;
    
    @Min (value=0)
    private double longitude;
    
    @Min (value=0)
    private double latitude;
    
    @Min (value=0)
    private double endLongitude;
    
    @Min (value=0)
    private double endLatitude;
    
    @Size(min=1)
    private String category;
    
    @Size(min=1)
    private String distance;
    
    @Size(min=1 , max= 700)
    private String imgUrl;
    
    @Size(min=10 , max= 700)
    private String description;
    
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
    @JoinColumn(name = "admin_id")
    private User admin;
    
    @OneToMany(mappedBy = "commentTrail",cascade=CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Comment> trailComments;

	public Trail() {
	}

	public Trail(@Size(min = 3) String name, @Size(min = 3) String location, @Size(min = 1) double longitude,
			@Size(min = 1) double latitude, @Size(min = 1) double endLongitude, @Size(min = 1) double endLatitude,
			@Size(min = 1) String category, @Size(min = 1) String distance, @Size(min = 1) String imgUrl,
			@Size(min = 10) String description) {
		this.name = name;
		this.location = location;
		this.longitude = longitude;
		this.latitude = latitude;
		this.endLongitude = endLongitude;
		this.endLatitude = endLatitude;
		this.category = category;
		this.distance = distance;
		this.imgUrl = imgUrl;
		this.description = description;
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
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getEndLongitude() {
		return endLongitude;
	}
	public void setEndLongitude(double endLongitude) {
		this.endLongitude = endLongitude;
	}
	public double getEndLatitude() {
		return endLatitude;
	}
	public void setEndLatitude(double endLatitude) {
		this.endLatitude = endLatitude;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getDistance() {
		return distance;
	}
	public void setDistance(String distance) {
		this.distance = distance;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
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
	public User getAdmin() {
		return admin;
	}
	public void setAdmin(User admin) {
		this.admin = admin;
	}
	public List<Comment> getTrailComments() {
		return trailComments;
	}
	public void setTrailComments(List<Comment> trailComments) {
		this.trailComments = trailComments;
	}
    
    
    
}
