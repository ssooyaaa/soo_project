package com.my.trip_scheduler.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping("/")
	public String home() {
		
		return "home";
	}
	
	@GetMapping("/newTitle")
	public String newTitle() {
		
		return "newTitle";
	}
	
	@GetMapping("/newList")
	public String newList() {
		
		return "newList";
	}
	
	@GetMapping("/allList")
	public String allList() {
		
		return "allList";
	}
	
	@GetMapping("/tripExpenses")
	public String tripExpenses() {
		
		return "tripExpenses";
	}
	
	@GetMapping("/receipt")
	public String receipt() {
		
		return "receipt";
	}
}
