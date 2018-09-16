package com.github.erodriguezg.springthymeleaf.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.erodriguezg.springthymeleaf.domain.User;
import com.github.erodriguezg.springthymeleaf.repository.UserRepository;

@Service
@Transactional(readOnly = true)
public class UserService {

	@Autowired
	private UserRepository userRepository;

	public User findByEmail(String email) {
		return userRepository.findByEmail(email);
	}

	public User findById(Long id) {
		return userRepository.findById(id).orElse(null);
	}

	public boolean emailDisponible(String email, Long userId) {
		User userByEmail = userRepository.findByEmail(email);
		if(userByEmail == null) {
			return true;
		}
		return userByEmail.getId().equals(userId);
	}

	@Transactional(readOnly = false)
	public User guardar(User user) {
		return null;
	}
}
