package com.masar.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.masar.models.BusinessTrail;
import com.masar.models.Trail;
import com.masar.models.User;
import com.masar.repository.BusinessTrailRepository;

@Service
public class BusinessTrailService {

	@Autowired
	private BusinessTrailRepository businessTrailRepository;
	@Autowired
	private UserService userService;
	public BusinessTrailService(BusinessTrailRepository businessTrailRepository, UserService userService) {
		
		this.businessTrailRepository = businessTrailRepository;
		this.userService = userService;
	}

	public List <BusinessTrail> getAllBusinessTrail(){
		return businessTrailRepository.findAll();
	}
	
	public List<BusinessTrail> getAllTrailsByClient(User user){
		return businessTrailRepository.findByclient(user);
	}
	
	public BusinessTrail findbusinessTrailById(Long id) {
		Optional<BusinessTrail> optionalbusinessTrail = businessTrailRepository.findById(id);
        if(optionalbusinessTrail.isPresent()) {
            return optionalbusinessTrail.get();
        } else {
            return null;
        }
    }
	
	public BusinessTrail creatBusinessTrail(BusinessTrail businessTrail) {
		return businessTrailRepository.save(businessTrail);
}
	
	public BusinessTrail updateBusinessTrail(BusinessTrail trail) {
		BusinessTrail editTrail = businessTrailRepository.findById(trail.getId()).orElse(null);
        assert editTrail!=null;
        editTrail.setName(trail.getName());
        editTrail.setCategory(trail.getCategory());
        editTrail.setDescription(trail.getDescription());
        editTrail.setPrice(trail.getPrice());
        return businessTrailRepository.save(editTrail);
    }
}
