package com.github.erodriguezg.springthymeleaf.form;

import java.io.Serializable;
import java.util.List;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import com.github.erodriguezg.springthymeleaf.domain.User;

public class CrearEditarUserForm implements Serializable {

	@NotNull
	@Valid
	private User user;
	
	private List<Integer> codeProfileSelectedList;
	
	private boolean modoEditar;
	
	private String confirmPassword;

	public List<Integer> getCodeProfileSelectedList() {
		return codeProfileSelectedList;
	}

	public void setCodeProfileSelectedList(List<Integer> codeProfileSelectedList) {
		this.codeProfileSelectedList = codeProfileSelectedList;
	}

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

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	
}
