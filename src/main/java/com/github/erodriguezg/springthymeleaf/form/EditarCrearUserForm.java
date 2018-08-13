package com.github.erodriguezg.springthymeleaf.form;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

import com.github.erodriguezg.springthymeleaf.domain.User;

public class EditarCrearUserForm implements Serializable {

	@NotNull
	private User user;
	
	private boolean modoEditar;

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
	
}
