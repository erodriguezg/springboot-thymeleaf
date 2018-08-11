package com.github.erodriguezg.springthymeleaf.form;

import java.io.Serializable;

public class ShowcaseForm implements Serializable {

	private Integer regionCode;
	
	private Integer provinciaCode;
	
	private Integer comunaCode;

	public Integer getRegionCode() {
		return regionCode;
	}

	public void setRegionCode(Integer regionCode) {
		this.regionCode = regionCode;
	}

	public Integer getProvinciaCode() {
		return provinciaCode;
	}

	public void setProvinciaCode(Integer provinciaCode) {
		this.provinciaCode = provinciaCode;
	}

	public Integer getComunaCode() {
		return comunaCode;
	}

	public void setComunaCode(Integer comunaCode) {
		this.comunaCode = comunaCode;
	}
	
}
