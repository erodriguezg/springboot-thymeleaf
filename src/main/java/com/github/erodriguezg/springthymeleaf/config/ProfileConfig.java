package com.github.erodriguezg.springthymeleaf.config;

import java.util.Arrays;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class ProfileConfig {

	@Value("${spring.profiles.active}")
	private String profileActive;
	
	private boolean devModeActive;
	
	@PostConstruct
	public void postConstruct() {
		this.devModeActive = Arrays.asList("DEV", "CI", "QA").stream().anyMatch(mode-> mode.equalsIgnoreCase(profileActive));
	}
	
	public boolean isDevModeActive() {
		return this.devModeActive;
	}
	
}
