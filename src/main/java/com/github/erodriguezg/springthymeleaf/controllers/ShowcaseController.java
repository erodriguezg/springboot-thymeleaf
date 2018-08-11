package com.github.erodriguezg.springthymeleaf.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.erodriguezg.springthymeleaf.domain.Provincia;
import com.github.erodriguezg.springthymeleaf.domain.Region;
import com.github.erodriguezg.springthymeleaf.form.ShowcaseForm;
import com.github.erodriguezg.springthymeleaf.services.ComunaService;
import com.github.erodriguezg.springthymeleaf.services.ProvinciaService;
import com.github.erodriguezg.springthymeleaf.services.RegionService;

@Controller
@PreAuthorize("isAuthenticated()")
@RequestMapping("/showcase")
public class ShowcaseController {
	
	private static Logger log = LoggerFactory.getLogger(ShowcaseController.class);

	@Autowired
	private RegionService regionService;
	
	@Autowired
	private ProvinciaService provinciaService;
	
	@Autowired
	private ComunaService comunaService;
	
	@GetMapping
	public String showcase(Model model) {
		log.debug("Entrando a showcase");
		model.addAttribute(new ShowcaseForm());
		model.addAttribute("regiones", regionService.findAll());
		return "showcase";
	}
	
	@GetMapping("/provincias")
	public String ajaxTraerProvincias(@RequestParam Integer regionCode, Model model) {
		log.debug("ajaxTraerProvincias -> regionId entrada: {}", regionCode);
		if(regionCode != null) {
			model.addAttribute("provincias", provinciaService.findByRegion(new Region(regionCode)));
		}
		return "showcase :: provincias";
	}

	@GetMapping("/comunas")
	public String ajaxTraerComunas(@RequestParam Integer provinciaCode, Model model) {
		log.debug("ajaxTraerComunas -> provinciaId: {}", provinciaCode);
		if(provinciaCode != null) {
			model.addAttribute("comunas", comunaService.findByProvincia(new Provincia(provinciaCode)));
		}
		return "showcase :: comunas";
	}
	
}
