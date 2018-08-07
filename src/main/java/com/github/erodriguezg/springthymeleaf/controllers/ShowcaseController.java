package com.github.erodriguezg.springthymeleaf.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@PreAuthorize("isAuthenticated()")
public class ShowcaseController {
	
	private static Logger log = LoggerFactory.getLogger(ShowcaseController.class);

	@GetMapping("/showcase")
	public String showcase() {
		log.debug("Entrando a showcase");
		return "showcase";
	}

}
