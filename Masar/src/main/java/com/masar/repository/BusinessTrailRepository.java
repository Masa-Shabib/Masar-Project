package com.masar.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.masar.models.BusinessTrail;
import com.masar.models.User;

@Repository

public interface BusinessTrailRepository extends CrudRepository<BusinessTrail,Long> {
	
	List<BusinessTrail> findAll();
	
	List<BusinessTrail> findByclient(User user);
	List<BusinessTrail> findByJoinedGuestsNotContaining(User user);
	
	List<BusinessTrail> findByJoinedGuestsContaining(User user);

}
