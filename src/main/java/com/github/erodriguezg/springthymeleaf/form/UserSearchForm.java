package com.github.erodriguezg.springthymeleaf.form;

import java.io.Serializable;

public class UserSearchForm implements Serializable {
	
	private Integer rut;
	
	private String email;
	
	private String firstName;
	
	private String lastName;
	
	private String telefonoMovil;
	
	private String telefonoFijo;
	
	private int profileCode;

	public Integer getRut() {
		return rut;
	}

	public void setRut(Integer rut) {
		this.rut = rut;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getTelefonoMovil() {
		return telefonoMovil;
	}

	public void setTelefonoMovil(String telefonoMovil) {
		this.telefonoMovil = telefonoMovil;
	}

	public String getTelefonoFijo() {
		return telefonoFijo;
	}

	public void setTelefonoFijo(String telefonoFijo) {
		this.telefonoFijo = telefonoFijo;
	}

	public int getProfileCode() {
		return profileCode;
	}

	public void setProfileCode(int profileCode) {
		this.profileCode = profileCode;
	}
	
	

}
