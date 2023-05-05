package com.my.csh_jwt.config;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.DatatypeConverter;

import org.springframework.web.servlet.HandlerInterceptor;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jwts;

public class TokenInterceptor implements HandlerInterceptor{

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		
		String url = request.getRequestURL().toString();
		String token = request.getHeader("token");
		
		
		System.out.println("인터셉터 진입");
		System.out.println(url);
		System.out.println(getSubject(token));
		
		
		if(url.contains("/auth") || url.equals("http://127.0.0.1:8080/csh_jwt/")) {
			
			return true;
		}else {
			
			String result = getSubject(token);
			
			if(result.equals("expired")) {
				response.sendRedirect(request.getContextPath()+"/auth/expired");
				return false;
			}else if(result.equals("fail")) {
				response.sendRedirect(request.getContextPath()+"/auth/fail");
				return false;
			}else {
				return true;
			}
		}
		
	}
	
	//토큰 검증 코드
	public String getSubject(String token) throws UnsupportedEncodingException{
				
		Claims claims = null;
		try{
			claims = Jwts.parserBuilder()
					.setSigningKey(DatatypeConverter.parseBase64Binary(JWTToken.SECRET_KEY))
					.build()
					.parseClaimsJws(token)
					.getBody();
			
			
		}catch(ExpiredJwtException  e) {
			return "expired";
		}catch (Exception e) {
			return "fail";
		}
		
		return claims.getSubject();
		
	}
}
