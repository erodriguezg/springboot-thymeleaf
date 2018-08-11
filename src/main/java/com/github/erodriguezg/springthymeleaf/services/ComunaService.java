package com.github.erodriguezg.springthymeleaf.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.erodriguezg.springthymeleaf.domain.Comuna;
import com.github.erodriguezg.springthymeleaf.domain.Provincia;
import com.github.erodriguezg.springthymeleaf.repository.ComunaRepository;

@Service
@Transactional(readOnly = true)
public class ComunaService {

	@Autowired
	private ComunaRepository comunaRepository;

	public List<Comuna> findByProvincia(Provincia provincia) {
		return comunaRepository.findByProvincia(provincia);
	}

}
