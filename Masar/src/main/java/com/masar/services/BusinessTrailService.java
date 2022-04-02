package com.masar.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.masar.models.BusinessTrail;
import com.masar.models.User;
import com.masar.repository.BusinessTrailRepository;

@Service
public class BusinessTrailService {

	@Autowired
	private BusinessTrailRepository businessTrailRepository;
	public BusinessTrailService(BusinessTrailRepository businessTrailRepository) {
		this.businessTrailRepository = businessTrailRepository;
	}

	public List <BusinessTrail> getAllBusinessTrail(){
		return businessTrailRepository.findAll();
	}
	
	public List<BusinessTrail> getAllTrailsByClient(User user){
		return businessTrailRepository.findByclient(user);
	}
	
	public List<BusinessTrail> findTrailsByLocation(String location){
		return businessTrailRepository.findByLocationContains(location);
	}
	
	public List<BusinessTrail> findTrailsByCategory(String category){
		return businessTrailRepository.findByCategoryContains(category);
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
        editTrail.setLocation(trail.getLocation());
        return businessTrailRepository.save(editTrail);
    }
	
	public void deleteTrail(long id) {
		businessTrailRepository.deleteById(id);
	}
	
	public BusinessTrail joinBusinessTrail(BusinessTrail trail, User joinedUser) {
		trail.getJoinedGuests().add(joinedUser);
		return businessTrailRepository.save(trail);
     }
	
	public BusinessTrail unJoinBusinessTrail(BusinessTrail trail, User joinedUser) {
		trail.getJoinedGuests().remove(joinedUser);
		return businessTrailRepository.save(trail);
     }
}
