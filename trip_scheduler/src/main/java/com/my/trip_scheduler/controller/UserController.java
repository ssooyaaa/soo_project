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
	
	
	//회원가입
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
	
	
	//회원가입-아이디중복확인
	@GetMapping("/getUserById")
	@ResponseBody
	public String getUserById(
			@RequestParam(value="id") String id
			) {
		
		
		String userId = userService.getUserById(id);
		
		return userId;
	}

	
	//회원가입-닉네임중복확인
	@GetMapping("/getUserByNick")
	@ResponseBody
	public String getUserByNick(
			@RequestParam(value="nick") String nick
			) {
		
		String userNick = userService.getUserByNick(nick);
	
		return userNick;
	}
	
	
	//로그인
	@GetMapping("/login")
	@ResponseBody
	public User login(
			@RequestParam(value="id") String id,
			@RequestParam(value="pw") String pw
			) {
		
		User user = new User();
		user.setId(id);
		user.setPw(pw);
		
		User getUser = userService.login(user);
		
		if(getUser==null) {
			return null;
		}else {
			return getUser;
		}
		
	}
	
	
	//비밀번호재설정-아이디/이메일 존재여부
	@GetMapping("/getUserByIdAndEmail")
	@ResponseBody
	public String getUserByIdAndEmail(
			@RequestParam(value="id") String id,
			@RequestParam(value="email") String email
			) {
		
		User user = new User();
		user.setId(id);
		user.setEmail(email);
		
		User getUser = userService.getUserByIdAndEmail(user);
		
		if(getUser==null) {
			return null;
		}else {
			return "ok";
		}
	}
	
	
	//비밀번호 재설정
	@PostMapping("/resetPw")
	@ResponseBody
	public String resetPw(
			@RequestParam(value="id") String id,
			@RequestParam(value="email") String email,
			@RequestParam(value="pw") String pw
			) {
		
		User user = new User();
		user.setId(id);
		user.setEmail(email);
		user.setPw(pw);
		
		userService.resetPw(user);
		
		return "ok";
	}
}
