package com.github.erodriguezg.springthymeleaf.config;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;

@Configuration
public class I18NConfig implements WebMvcConfigurer  {
	
	@Autowired
	private ProfileConfig profileConfig;
	
	@Bean
	public LocaleResolver localeResolver() {
		CookieLocaleResolver r = new CookieLocaleResolver();
        r.setCookieName("localeInfo");
        r.setDefaultLocale(new Locale("es", "CL"));

        //if set to -1, the cookie is deleted
        // when browser shuts down
        r.setCookieMaxAge(24*60*60);
        return r;
	}
	
	@Bean
	public MessageSource messageSource() {
	    ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
	    messageSource.setBasename("i18n/messages");
	    messageSource.setUseCodeAsDefaultMessage(true);
	    messageSource.setFallbackToSystemLocale(false);
	    if(profileConfig.isDevModeActive()) {
	    	 messageSource.setCacheSeconds(0); //NO USAR EN 0 PARA PRODUCTIVO!
	    }
	    messageSource.setDefaultEncoding("ISO-8859-1");
	    return messageSource;
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		LocaleChangeInterceptor l = new LocaleChangeInterceptor();
        l.setParamName("lang");
        registry.addInterceptor(l);
	}
	
}
