package com.github.erodriguezg.springthymeleaf.security;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.GenericFilterBean;

import com.github.erodriguezg.springthymeleaf.domain.User;

public class JwtTokenFilter extends GenericFilterBean {
	
	private static Logger log = LoggerFactory.getLogger(JwtTokenFilter.class);

	private JwtTokenProvider jwtTokenProvider;

	public JwtTokenFilter(JwtTokenProvider jwtTokenProvider) {
		this.jwtTokenProvider = jwtTokenProvider;
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain filterChain)
			throws IOException, ServletException {

		String token = jwtTokenProvider.resolveToken((HttpServletRequest) req);
		try {
			if (token != null && jwtTokenProvider.validateToken(token)) {
				Authentication auth = jwtTokenProvider.getAuthentication(token);
				SecurityContextHolder.getContext().setAuthentication(auth);
				refreshToken(auth, (HttpServletResponse)res);
			}
		} catch (RuntimeException ex) {
			log.error("error filtro jwt: ", ex);
			HttpServletResponse response = (HttpServletResponse) res;
			response.sendError(HttpStatus.INTERNAL_SERVER_ERROR.value(), ex.getMessage());
			return;
		}

		filterChain.doFilter(req, res);
	}

	private void refreshToken(Authentication auth, HttpServletResponse httpResponse) {
		User user = (User) auth.getPrincipal();
		String bearerToken = jwtTokenProvider.createToken(user.getEmail(), auth.getAuthorities());
		jwtTokenProvider.createAuthorizationHeader(httpResponse, bearerToken);
	}

}