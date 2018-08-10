package com.github.erodriguezg.springthymeleaf.security;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import com.github.erodriguezg.springthymeleaf.domain.Profile;
import com.github.erodriguezg.springthymeleaf.domain.User;
import com.github.erodriguezg.springthymeleaf.services.UserService;
import com.github.erodriguezg.springthymeleaf.utils.ConstantesUtil;

@Component
public class CustomAuthenticationProvider implements AuthenticationProvider {
	
	private static final Logger log = LoggerFactory.getLogger(CustomAuthenticationProvider.class);
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	public Authentication authenticate(Authentication authentication)  {
		
		String email = authentication.getName();
        String password = authentication.getCredentials().toString();
        
        User user = userService.findByEmail(email);
		
        if (user == null) {
        	log.debug("email no registrado: {}", email);
        	throw new BadCredentialsException(ConstantesUtil.MSJ_ERROR_CREDENCIALES_INVALIDAS);
        }
        
        if (!passwordEncoder.matches(password, user.getPassword())) {
        	log.debug("password incorrecto!");
        	throw new BadCredentialsException(ConstantesUtil.MSJ_ERROR_CREDENCIALES_INVALIDAS);
        }
        
        return new UsernamePasswordAuthenticationToken(
                user, password, getGranthedAuthorities(user.getProfiles()) );
	}

	private List<GrantedAuthority> getGranthedAuthorities(List<Profile> profiles) {
		if(profiles == null) {
			return Collections.emptyList();
		}
		
		return profiles.stream()
				.map(profile -> new SimpleGrantedAuthority(profile.getName()))
				.collect(Collectors.toList());
		
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(
		          UsernamePasswordAuthenticationToken.class);
	}

}
