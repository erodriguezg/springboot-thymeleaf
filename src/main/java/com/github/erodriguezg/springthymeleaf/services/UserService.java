package com.github.erodriguezg.springthymeleaf.services;

import com.github.erodriguezg.springthymeleaf.domain.User;
import com.github.erodriguezg.springthymeleaf.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
public class UserService {

    private UserRepository userRepository;

    private PasswordEncoder passwordEncoder;

    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    public User findById(Long id) {
        return userRepository.findById(id).orElse(null);
    }

    public boolean emailDisponible(String email, Long userId) {
        User userByEmail = userRepository.findByEmail(email);
        if (userByEmail == null) {
            return true;
        }
        return userByEmail.getId().equals(userId);
    }

    @Transactional(readOnly = false)
    public User guardar(User user) {
        if(user.getId() == null) {
            String passEncoded = passwordEncoder.encode(user.getPassword());
            user.setPassword(passEncoded);
        }
        User userPersistido = userRepository.save(user);
        return findById(userPersistido.getId());
    }

    @Autowired
    public void setUserRepository(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Autowired
    public void setPasswordEncoder(PasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
    }

}
