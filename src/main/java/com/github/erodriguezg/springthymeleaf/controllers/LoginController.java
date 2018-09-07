package com.github.erodriguezg.springthymeleaf.controllers;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.erodriguezg.springthymeleaf.domain.User;
import com.github.erodriguezg.springthymeleaf.security.JwtTokenProvider;
import com.github.erodriguezg.springthymeleaf.services.UserService;
import com.github.erodriguezg.springthymeleaf.utils.ConstantesUtil;

@Controller
@RequestMapping("/login")
public class LoginController {

	private static Logger log = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private JwtTokenProvider jwtTokenProvider;

	@Autowired
	private UserService userService;

	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@GetMapping
	public String irLogin() {
		return "login";
	}

	@PostMapping
	public String login(@RequestParam String email, @RequestParam String password, HttpServletResponse response) {

		User user = userService.findByEmail(email);

		if (user == null) {
			log.debug("email no registrado: {}", email);
			throw new BadCredentialsException(ConstantesUtil.MSJ_ERROR_CREDENCIALES_INVALIDAS);
		}

		if (!passwordEncoder.matches(password, user.getPassword())) {
			log.debug("password incorrecto!");
			throw new BadCredentialsException(ConstantesUtil.MSJ_ERROR_CREDENCIALES_INVALIDAS);
		}

		String token = jwtTokenProvider.createToken(user);
		
		Cookie authorizationCookie = new Cookie("auth", token);
		authorizationCookie.setSecure(false);
		authorizationCookie.setMaxAge(3600);
		authorizationCookie.setPath("/");
		authorizationCookie.setHttpOnly(true);
		response.addCookie(authorizationCookie);
		
		return "redirect:/";
	}

}
