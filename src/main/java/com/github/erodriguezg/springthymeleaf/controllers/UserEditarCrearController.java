package com.github.erodriguezg.springthymeleaf.controllers;

import java.util.List;
import java.util.stream.Collectors;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.erodriguezg.springthymeleaf.domain.Profile;
import com.github.erodriguezg.springthymeleaf.domain.User;
import com.github.erodriguezg.springthymeleaf.form.CrearEditarUserForm;
import com.github.erodriguezg.springthymeleaf.services.ProfileService;
import com.github.erodriguezg.springthymeleaf.services.UserService;

@Controller
@PreAuthorize("hasAnyAuthority('Administrador')")
@RequestMapping("/users")
public class UserEditarCrearController {
	
	private static final String USER_CREAR_EDITAR_OUTCOME = "user/crear_editar";
	
	private static final String EMAIL_DISPONIBLE_ATTR = "email-disponible";

	private static Logger log = LoggerFactory.getLogger(UserEditarCrearController.class);
	
	@Autowired
	private UserService userService;

	@Autowired
	private ProfileService profileService;
	
	@ModelAttribute("profiles")
	public List<Profile> getProfiles() {
		return profileService.findAll();
	}
	
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
		return USER_CREAR_EDITAR_OUTCOME;
	}
	
	
	@PostMapping("/crear-editar")
	public String guardar(@Valid @ModelAttribute  CrearEditarUserForm userForm, BindingResult result, Model model) {
		model.addAttribute(userForm);
		
		validarConfirmarPassword(userForm, result);
		validarAlMenosUnPerfil(userForm, result);
		
		if(result.hasErrors()) {
			log.debug("ocurrieron errores en el formulario");
			return USER_CREAR_EDITAR_OUTCOME;
		}
		
		List<Profile> profileListSelected = userForm.getCodeProfileSelectedList().stream()
			.map(code -> {
				Profile profile = new Profile();
				profile.setCode(code);
				return profile;
			}).collect(Collectors.toList());
		
		userForm.getUser().setProfiles(profileListSelected);
		
		log.debug("persistencia");
		log.debug("no ocurrieron errores en el formulario");
		model.addAttribute("mensaje-info", "mensaje de exito");
		return USER_CREAR_EDITAR_OUTCOME;
	}
	
	private void validarAlMenosUnPerfil(CrearEditarUserForm userForm, BindingResult result) {
		List<Integer> lista = userForm.getCodeProfileSelectedList();
		if(lista == null || lista.isEmpty()) {
			result.rejectValue("codeProfileSelectedList", "error.selecciones-al-menos-uno");
		}
		
	}

	private void validarConfirmarPassword(CrearEditarUserForm userForm, BindingResult result) {
		String confirmPassword = userForm.getConfirmPassword();
		String password = userForm.getUser().getPassword();
		
		if(confirmPassword != null && password != null && !confirmPassword.equals(password)) {
			result.rejectValue("confirmPassword", "error.password-no-coinciden");
		}
		
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
		
		return USER_CREAR_EDITAR_OUTCOME + " :: seccion-email";
	}
	
}
