package com.github.erodriguezg.springthymeleaf.controllers;

import javax.validation.Valid;
import javax.validation.constraints.Email;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.erodriguezg.springthymeleaf.domain.User;
import com.github.erodriguezg.springthymeleaf.form.CrearEditarUserForm;
import com.github.erodriguezg.springthymeleaf.services.UserService;

@Controller
@PreAuthorize("hasAnyAuthority('Administrador')")
@RequestMapping("/users")
public class UserEditarCrearController {
	
	private static final String EMAIL_DISPONIBLE_ATTR = "email-disponible";

	private static Logger log = LoggerFactory.getLogger(UserEditarCrearController.class);
	
	@Autowired
	private UserService userService;

	
	@GetMapping("/crear-editar")
	public String iniciarCrearEditar(@RequestParam(required = false) Long id, Model model) {
		log.debug("inciarCrearEditar -> id: {}", id);
		
		User user;
		boolean modoEditar;
		if(id != null) {
			modoEditar = true;
			user = userService.findById(id);
		}
		else {
			modoEditar = false;
			user = new User();
		}
		
		CrearEditarUserForm form = new CrearEditarUserForm();
		form.setModoEditar(modoEditar);
		form.setUser(user);
		
		model.addAttribute(new CrearEditarUserForm());
		return "user/crear_editar";
	}
	
	@GetMapping("/verificar-email")
	public String verificarExistenciaEmail(
			@Valid @Email @RequestParam String email,  
			BindingResult result, 
			@RequestParam Long userId, Model model) {
		boolean disponible = userService.emailDisponible(email, userId);
		
		if(!result.hasErrors()) {
			if(disponible) {
				model.addAttribute(EMAIL_DISPONIBLE_ATTR , true);
			}
			else {
				model.addAttribute(EMAIL_DISPONIBLE_ATTR, false);
			}
		}
		
		return "user/crear_editar :: seccion-email";
	}
	
	@PostMapping("/guardar")
	public String guardar(@RequestBody User user, BindingResult result) {
		return "user/crear_editar :: seccion-formulario";
	}
	
}
