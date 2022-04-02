package com.masar.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.masar.models.Trail;
import com.masar.repository.TrailRepository;

@Service
public class TrailService {
	private final TrailRepository trailRepository;

	public TrailService(TrailRepository trailRepository) {
		this.trailRepository = trailRepository;
	}
	
	
	public List<Trail> allTrails(){
		return trailRepository.findAll();
	}
	
	public Trail findTrailById(Long id) {
		Optional<Trail> optionalTrail = trailRepository.findById(id);
        if(optionalTrail.isPresent()) {
            return optionalTrail.get();
        } else {
            return null;
        }
    }
	
	public List<Trail> top3(){
		return trailRepository.findTop3ByOrderByLocationDesc();
	}
	
	public List<Trail> findTrailsByLocation(String location){
		return trailRepository.findByLocationContains(location);
	}
	

	

	public List<Trail> findTrailsByCategory(String category){
		return trailRepository.findByCategoryContains(category);
	}
	
	
	public Trail creatTrail(Trail trail) {
        return trailRepository.save(trail);
        }
	
	public Trail updateTrail(Trail trail) {
        Trail editTrail = trailRepository.findById(trail.getId()).orElse(null);
        assert editTrail!=null;
        editTrail.setName(trail.getName());
        editTrail.setCategory(trail.getCategory());
        editTrail.setDescription(trail.getDescription());
        editTrail.setDistance(trail.getDistance());
        editTrail.setImgUrl(trail.getImgUrl());
        editTrail.setLocation(trail.getLocation());
        editTrail.setLatitude(trail.getLatitude());
        editTrail.setLongitude(trail.getLongitude());
        editTrail.setEndLatitude(trail.getEndLatitude());
        editTrail.setEndLongitude(trail.getEndLongitude());
        return trailRepository.save(editTrail);
    }
	
	public void delete(Long id) {
		Trail deleteTrail = trailRepository.findById(id).orElse(null); 
		trailRepository.delete(deleteTrail);
      }
	
}
