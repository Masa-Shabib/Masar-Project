package com.masar.repository;


import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.masar.models.Trail;


@Repository
public interface TrailRepository extends CrudRepository<Trail, Long> {
	List <Trail> findAll();
	List <Trail> findByLocationContains(String location); 
	List <Trail> findByCategoryContains(String category);
	List<Trail> findTop3ByOrderByLocationDesc();
	
}
