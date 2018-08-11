package com.github.erodriguezg.springthymeleaf.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.github.erodriguezg.springthymeleaf.domain.Comuna;
import com.github.erodriguezg.springthymeleaf.domain.Provincia;

@Repository
public interface ComunaRepository extends CrudRepository<Comuna, Integer> {

	List<Comuna> findByProvincia(Provincia provincia);

}
