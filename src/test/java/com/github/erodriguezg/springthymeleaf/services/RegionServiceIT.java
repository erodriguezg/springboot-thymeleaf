package com.github.erodriguezg.springthymeleaf.services;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.github.erodriguezg.springthymeleaf.ApplicationTests;
import com.github.erodriguezg.springthymeleaf.domain.Region;

public class RegionServiceIT extends ApplicationTests {

	@Autowired
	private RegionService regionService;
	
	@Test
	public void testFindAll() {
		List<Region> regionList = regionService.findAll();
		assertThat(regionList).isNotEmpty();
	}
}
