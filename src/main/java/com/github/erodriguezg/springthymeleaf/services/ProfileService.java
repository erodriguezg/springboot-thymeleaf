package com.github.erodriguezg.springthymeleaf.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.erodriguezg.springthymeleaf.domain.Profile;
import com.github.erodriguezg.springthymeleaf.repository.ProfileRepository;

@Service
@Transactional(readOnly = true)
public class ProfileService {
	
	
	@Autowired
	private ProfileRepository profileRepository;
	
	public List<Profile> findAll() {
		return profileRepository.findAll();
	}

}
