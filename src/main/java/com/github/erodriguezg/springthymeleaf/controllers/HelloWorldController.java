package com.github.erodriguezg.springthymeleaf.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloWorldController {

	@GetMapping("/hola")
	public String hello() {
		return "hello world";
	}

}
