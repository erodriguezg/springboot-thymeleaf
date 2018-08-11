package com.github.erodriguezg.springthymeleaf.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.erodriguezg.springthymeleaf.domain.Provincia;
import com.github.erodriguezg.springthymeleaf.domain.Region;
import com.github.erodriguezg.springthymeleaf.repository.ProvinciaRepository;

@Service
@Transactional(readOnly = true)
public class ProvinciaService {

	@Autowired
	private ProvinciaRepository provinciaRepository;
	
	public List<Provincia> findByRegion(Region region) {
		return provinciaRepository.findByRegion(region);
	}
	
}
