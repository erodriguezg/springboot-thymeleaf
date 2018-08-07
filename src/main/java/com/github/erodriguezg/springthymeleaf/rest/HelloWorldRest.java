package com.github.erodriguezg.springthymeleaf.rest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloWorldRest {

	@GetMapping("/hola")
	public String hello() {
		return "hello world";
	}

}
