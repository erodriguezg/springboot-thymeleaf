package com.github.erodriguezg.springthymeleaf.security;

import java.util.Arrays;
import java.util.Base64;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

import javax.annotation.PostConstruct;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;

import com.github.erodriguezg.springthymeleaf.domain.User;
import com.github.erodriguezg.springthymeleaf.services.UserService;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

@Component
public class JwtTokenProvider {

	/**
	 * THIS IS NOT A SECURE PRACTICE! For simplicity, we are storing a static key
	 * here. Ideally, in a microservices environment, this key would be kept on a
	 * config-server.
	 */
	@Value("${security.jwt.token.secret-key:secret-key}")
	private String secretKey;

	@Value("${security.jwt.token.expire-length:3600000}")
	private long validityInMilliseconds = 3600000; // 1h

	@Autowired
	private UserService userService;
	
	@PostConstruct
	protected void init() {
		secretKey = Base64.getEncoder().encodeToString(secretKey.getBytes());
	}
	
	public String createToken(User user) {
		List<GrantedAuthority> grantedAuthorities = user.getProfiles().stream()
				.map(profile -> new SimpleGrantedAuthority(profile.getName()))
				.collect(Collectors.toList());
		return createToken(user.getEmail(), grantedAuthorities);
	}

	public String createToken(String email, Collection<? extends GrantedAuthority> roles) {

		Claims claims = Jwts.claims().setSubject(email);
		claims.put("auth", roles.stream().filter(Objects::nonNull).collect(Collectors.toList()));

		Date now = new Date();
		Date validity = new Date(now.getTime() + validityInMilliseconds);

		return Jwts.builder()//
				.setClaims(claims)//
				.setIssuedAt(now)//
				.setExpiration(validity)//
				.signWith(SignatureAlgorithm.HS256, secretKey)//
				.compact();
	}

	public Authentication getAuthentication(String token) {
		String email = getEmail(token);
		List<GrantedAuthority> roles = getRoles(token);
		User user  = userService.findByEmail(email);
		return new UsernamePasswordAuthenticationToken(user, "", roles);
	}

	private List<GrantedAuthority> getRoles(String token) {
		 List<Map<String,String>> roles = (List<Map<String,String>>) Jwts.parser().setSigningKey(secretKey).parseClaimsJws(token).getBody().get("auth");
		 String rolText = roles.get(0).get("authority");
		 return Collections.singletonList(new SimpleGrantedAuthority(rolText));
	}

	public String getEmail(String token) {
		return Jwts.parser().setSigningKey(secretKey).parseClaimsJws(token).getBody().getSubject();
	}

	public String resolveToken(HttpServletRequest req) {
		
		if(req.getCookies() == null) {
			return null;
		}
		
		return Arrays.stream(req.getCookies())
			.filter(cookie -> cookie.getName().equals("auth"))
			.map(Cookie::getValue)
			.findFirst().orElse(null);
	}
	
	public void createAuthorizationHeader(HttpServletResponse httResponse, String bearerToken) {
		httResponse.setHeader("Authorization", bearerToken);
	}

	public boolean validateToken(String token) {
		try {
			Jwts.parser().setSigningKey(secretKey).parseClaimsJws(token);
			return true;
		} catch (JwtException | IllegalArgumentException e) {
			throw new IllegalStateException("Expired or invalid JWT token" + HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

}