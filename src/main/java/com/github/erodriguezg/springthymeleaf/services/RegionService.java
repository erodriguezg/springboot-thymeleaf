package com.github.erodriguezg.springthymeleaf.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.erodriguezg.springthymeleaf.domain.Region;
import com.github.erodriguezg.springthymeleaf.repository.RegionRepository;

@Service
@Transactional(readOnly = true)
public class RegionService {

	@Autowired
	private RegionRepository regionRepository;

	public List<Region> findAll() {
		return regionRepository.findAll();
	}

}
