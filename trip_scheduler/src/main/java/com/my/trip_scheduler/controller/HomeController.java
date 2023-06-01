package com.my.trip_scheduler.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping("/")
	public String home() {
		
		return "home";
	}
	
	@GetMapping("/newList")
	public String newList() {
		
		return "newList";
	}
}
