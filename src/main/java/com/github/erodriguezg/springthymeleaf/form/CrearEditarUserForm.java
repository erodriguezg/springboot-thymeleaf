package com.github.erodriguezg.springthymeleaf.form;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

import com.github.erodriguezg.springthymeleaf.domain.Profile;
import com.github.erodriguezg.springthymeleaf.domain.User;

public class CrearEditarUserForm implements Serializable {

	@NotNull
	private User user;
	
	@NotNull
	private Profile profile;
	
	private boolean modoEditar;
	
	private String confirmPassword;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public boolean isModoEditar() {
		return modoEditar;
	}

	public void setModoEditar(boolean modoEditar) {
		this.modoEditar = modoEditar;
	}

	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	
	
	
	
}
