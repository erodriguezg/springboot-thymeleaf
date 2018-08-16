package com.github.erodriguezg.springthymeleaf.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.erodriguezg.springthymeleaf.services.ProfileService;

@Controller
@RequestMapping("/profile")
public class ProfileController {

	@Autowired
	private ProfileService profileService;
	
	@RequestMapping("/all")
	public String findAll(Model model) {
		model.addAttribute("profiles", profileService.findAll());
		return "comun/profiles :: profiles"; 
	}
	
}
