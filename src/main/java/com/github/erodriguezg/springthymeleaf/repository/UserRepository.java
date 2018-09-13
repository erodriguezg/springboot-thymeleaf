package com.github.erodriguezg.springthymeleaf.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.github.erodriguezg.springthymeleaf.domain.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {

	@EntityGraph("graph.user.profiles")
	Optional<User> findById(Long id);
	
	@EntityGraph("graph.user.profiles")
	User findByEmail(String email);
	
}
