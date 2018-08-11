package com.github.erodriguezg.springthymeleaf.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.github.erodriguezg.springthymeleaf.domain.Provincia;
import com.github.erodriguezg.springthymeleaf.domain.Region;

@Repository
public interface ProvinciaRepository extends CrudRepository<Provincia, Integer> {

	List<Provincia> findByRegion(Region region);
	
}
