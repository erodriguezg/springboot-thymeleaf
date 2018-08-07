package com.github.erodriguezg.springthymeleaf.controllers;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WelcomeController {

	@GetMapping("/")
	public String welcome(Map<String,Object> model) {
		model.put("message", "hola mundo!!");
		return "welcome";
	}
	
}
