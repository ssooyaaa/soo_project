package com.my.trip_scheduler.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.my.trip_scheduler.vo.User;

@Controller
public class HomeController {
	
	
	//세션관리
	void setUserSession(HttpSession session, Model model) {
		User loginUser = (User)session.getAttribute("loginUser");
		model.addAttribute("loginUser",loginUser);
	}

	
	//홈화면
	@GetMapping("/")
	public String home() {
		
		return "home";
	}
	
	
	//새일정짜기
	@GetMapping("/newTitle")
	public String newTitle(HttpSession s) {
		
		User loginUser = (User)s.getAttribute("loginUser");
		
		if(loginUser==null) {
			return "redirect:/login";
		}else {
			return "newTitle";
		}
		
	}
	
	
	//새일정짜기-리스트 작성
	@GetMapping("/newList")
	public String newList() {
		
		return "newList";
	}
	
	
	//여행리스트
	@GetMapping("/allList")
	public String allList(HttpSession s) {
		
		User loginUser = (User)s.getAttribute("loginUser");
		
		if(loginUser==null) {
			return "redirect:/login";
		}else {
			return "allList";
		}
		
	}
	
	//여행경비
	@GetMapping("/tripExpenses")
	public String tripExpenses(HttpSession s) {
		
		User loginUser = (User)s.getAttribute("loginUser");
		
		if(loginUser==null) {
			return "redirect:/login";
		}else {
			return "tripExpenses";
		}
		
	}
	
	
	//여행경비-영수증
	@GetMapping("/receipt")
	public String receipt() {
		
		return "receipt";
	}
	
	
	//로그인
	@GetMapping("/login")
	public String login() {
		
		return "login";
	}
	
	
	//회원가입
	@GetMapping("/join")
	public String join() {
		
		return "join";
	}
	
	
	//비밀번호재설정
	@GetMapping("/pwReset")
	public String pwReset() {
		
		return "pwReset";
	}
	
	
	//친구관리-친구리스트
	@GetMapping("/memberList")
	public String memberList() {
		
		return "memberList";
	}
	
	
	//친구관리-알림
	@GetMapping("/memberAlarm")
	public String memberAlarm() {
		
		return "memberAlarm";
	}
	
}
