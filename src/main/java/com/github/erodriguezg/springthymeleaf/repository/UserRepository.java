package com.github.erodriguezg.springthymeleaf.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.EntityGraph.EntityGraphType;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.github.erodriguezg.springthymeleaf.domain.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {

	@EntityGraph(value = "UserWithProfiles", type = EntityGraphType.FETCH)
	Optional<User> findById(Long id);
	
	@EntityGraph(value = "UserWithProfiles", type = EntityGraphType.FETCH)
	User findByEmail(String email);
	
}
