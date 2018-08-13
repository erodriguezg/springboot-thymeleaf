package com.github.erodriguezg.springthymeleaf.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.erodriguezg.springthymeleaf.form.UserSearchForm;
import com.github.erodriguezg.springthymeleaf.services.UserService;

@Controller
@PreAuthorize("hasRole('Administrador')")
@RequestMapping("/user-gestionar")
public class UserGestionarController {

	private static Logger log = LoggerFactory.getLogger(UserGestionarController.class);

	@Autowired
	private UserService userService;

	@GetMapping
	public String irGestionar() {
		log.debug("entre a gestionar usuarios");
		return "users/gestionar";
	}

	@PostMapping("/filtros-busqueda")
	public String filtrosBusqueda(@RequestBody UserSearchForm form, BindingResult results) {

		return "user/gestionar :: filtrosYresultados";
	}

}
