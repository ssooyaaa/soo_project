package com.my.csh_jwt.controller;

import java.security.Key;
import java.util.Date;

import javax.crypto.spec.SecretKeySpec;
import javax.xml.bind.DatatypeConverter;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.csh_jwt.config.JWTToken;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

@Controller
@RequestMapping(value="/auth")
public class AuthController {
	
	
	//토큰 생성 코드
	public String createToken(String subject, long expTime) {
		if(expTime<-0) {
			throw new RuntimeException("만료시간이 0보다 커야함.");
		}
		
		
		SignatureAlgorithm signatureAlgorithm = SignatureAlgorithm.HS256;
		
		byte[] secretKeyBytes = DatatypeConverter.parseBase64Binary(JWTToken.SECRET_KEY);
		Key signingKey = new SecretKeySpec(secretKeyBytes,signatureAlgorithm.getJcaName());
		
		return Jwts.builder()
				.setSubject(subject)
				.signWith(signingKey,signatureAlgorithm)
				.setExpiration(new Date(System.currentTimeMillis()+expTime))
				.compact();
	}

	
	@GetMapping("expired")
	@ResponseBody
	public String expired() {
		
		return "expired";
	}
	
	
	@GetMapping("fail")
	@ResponseBody
	public String fail() {
		
		return "fail";
	}
	
	
	
	@GetMapping("create_token")
	@ResponseBody
	public String createToken(
			@RequestParam(value="id") String id
			) {
		
		
		String token = createToken(id,2*60*1000);
		
		return token;
	}
}
