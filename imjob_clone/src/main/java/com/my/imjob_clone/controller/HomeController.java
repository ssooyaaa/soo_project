package com.my.imjob_clone.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "home";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		
		return "login";
	}
	
	@RequestMapping(value ="/membership", method = RequestMethod.GET)
	public String membership() {
		
		return "membership";
	}
	
	@RequestMapping(value="/membershipForm", method=RequestMethod.GET)
	public String membershipForm() {
		
		return "membershipForm";
	}
	
	@RequestMapping(value="/newWork", method=RequestMethod.GET)
	public String newWork() {
		
		return "newWork";
	}
	
	@RequestMapping(value="/projectList", method=RequestMethod.GET)
	public String projectList() {
		
		return "projectList";
	}
	
	@RequestMapping(value="/commission", method=RequestMethod.GET)
	public String commission() {
		
		return "commission";
	}
}
