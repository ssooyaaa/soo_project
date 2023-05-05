package com.my.csh_jwt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {

	
	@GetMapping("/")
	public String home() {
		
		return "home";
	}
	
	@GetMapping("mypage")
	@ResponseBody
	public String mypage() {
		
		return "id:soo / pw:1234";
	}
}
