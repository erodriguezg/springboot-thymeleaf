package com.github.erodriguezg.springthymeleaf.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;

import com.github.erodriguezg.springthymeleaf.security.CustomAuthenticationProvider;
import com.github.erodriguezg.springthymeleaf.security.JwtTokenFilterConfigurer;
import com.github.erodriguezg.springthymeleaf.security.JwtTokenProvider;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private CustomAuthenticationProvider authProvider;
	
	
	 @Autowired
	  private JwtTokenProvider jwtTokenProvider;
	

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.authenticationProvider(authProvider);
    }
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		http
		.authorizeRequests()
			.antMatchers("/", "/home", "/login", "/favicon.ico",  "/resources/**" ).permitAll()
		.anyRequest()
			.authenticated();
		/*.and()
			.formLogin()
				.loginPage("/login").permitAll()
		.and()
			.logout().permitAll();*/
		
		 // Disable CSRF (cross site request forgery)
	    http.csrf().disable();
		
	 // If a user try to access a resource without having enough permissions
	    http.exceptionHandling().accessDeniedPage("/login");
	    
		 // No session will be created or used by spring security
	    http.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS);

	    // Apply JWT
	    http.apply(new JwtTokenFilterConfigurer(jwtTokenProvider));
	    
		
	}
}