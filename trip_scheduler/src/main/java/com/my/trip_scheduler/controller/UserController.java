package com.my.trip_scheduler.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.trip_scheduler.service.UserService;
import com.my.trip_scheduler.vo.User;

@Controller
@RequestMapping(value="/user")
public class UserController {
	
	@Autowired
	UserService userService;
	
	@PostMapping("/addUser")
	@ResponseBody
	public String addUser(
			@RequestParam(value="id") String id,
			@RequestParam(value="pw") String pw,
			@RequestParam(value="email") String email,
			@RequestParam(value="nickname") String nickname
			) {
		
		User newUser = new User();
		newUser.setId(id);
		newUser.setPw(pw);
		newUser.setEmail(email);
		newUser.setNickname(nickname);
		
		userService.addUser(newUser);
		
		return "ok";
	}
	
	@GetMapping("/getUserById")
	@ResponseBody
	public String getUserById(
			@RequestParam(value="id") String id
			) {
		
		
		String userId = userService.getUserById(id);
		
		return userId;
	}

	@GetMapping("/getUserByNick")
	@ResponseBody
	public String getUserByNick(
			@RequestParam(value="nick") String nick
			) {
		
		String userNick = userService.getUserByNick(nick);
	
		return userNick;
	}
}
