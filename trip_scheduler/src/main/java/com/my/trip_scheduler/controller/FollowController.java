package com.my.trip_scheduler.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.trip_scheduler.service.FollowService;
import com.my.trip_scheduler.vo.Follow;
import com.my.trip_scheduler.vo.User;

@Controller
@RequestMapping(value="/follow")
public class FollowController {

	@Autowired
	FollowService followService;
	
	
	//친구 승락 리스트
	@GetMapping("/getFollow")
	@ResponseBody
	public List<User> getFollow(HttpSession s){
		
		Follow fl = new Follow();
		
		User loginUser = (User)s.getAttribute("loginUser");
		int user_idx=0;
		String loginUser_id=null;
		
		if(loginUser==null) {
			User kakaoUser = (User)s.getAttribute("kakaoUser");
			user_idx = kakaoUser.getUser_idx();
			loginUser_id = kakaoUser.getId();
		}else {
			user_idx = loginUser.getUser_idx();
			loginUser_id = loginUser.getId();
		}
		
		fl.setUser_idx_1(user_idx);
		fl.setUser_idx_2(user_idx);
		
		List<User> flList = followService.getFollow(fl);
		
		List<User> newFlList = new ArrayList<>();
		
		
		if(flList==null) {
			return null;
		}else {
			for(int i=0;i<flList.size();i++) {
				if(flList.get(i).getId().equals(loginUser_id)) {
					continue;
				}else {
					newFlList.add(flList.get(i));
				}
			}
			
			return newFlList;
		}
		
		
		
	}
	
	
	//친구요청
	@PostMapping("/requestFollow")
	@ResponseBody
	public String requestFollow(
			@RequestParam(value="user_idx_2") int user_idx_2,
			HttpSession s
			) {
		
		User loginUser = (User)s.getAttribute("loginUser");
		int user_idx_1 = 0;
		
		if(loginUser==null) {
			User kakaoUser = (User)s.getAttribute("kakaoUser");
			user_idx_1 = kakaoUser.getUser_idx();
			
		}else {
			user_idx_1 = loginUser.getUser_idx();
		}
		
		
		Follow f = new Follow();
		f.setUser_idx_1(user_idx_1);
		f.setUser_idx_2(user_idx_2);
		f.setFl_state("대기");
		
		followService.requestFollow(f);
		
		return "ok";
	}
	
	
	//친구요청-승인/대기  상태 확인
	@Transactional
	@GetMapping("/requestedFollow")
	@ResponseBody
	public User requestedFollow(
			@RequestParam(value="user_idx") int user_idx,
			HttpSession s) {
		
		User loginUser = (User)s.getAttribute("loginUser");
		int loginUserIdx = 0;
		
		if(loginUser==null) {
			
			User kakaoUser = (User)s.getAttribute("kakaoUser");
			loginUserIdx = kakaoUser.getUser_idx();
			
		}else {
			loginUserIdx = loginUser.getUser_idx();
		}
		
		Follow f1 = new Follow();
		f1.setUser_idx_1(loginUserIdx);
		f1.setUser_idx_2(user_idx);
		
		User user1 = followService.checkUserOne(f1);
		
		Follow f2 = new Follow();
		f2.setUser_idx_1(user_idx);
		f2.setUser_idx_2(loginUserIdx);
		
		User user2 = followService.checkUserTwo(f2);
		
		System.out.println(user1);
		System.out.println(user2);
		if(user1==null && user2==null) {
			return null;
		}else if(user1==null) {
			return user2;
		}else{
			return user1;
		}
		
	}
	
	
	//친구알림 카운트
	@GetMapping("/getCountAlarm")
	@ResponseBody
	public int getCountAlarm(HttpSession s) {
		
		User loginUser = (User)s.getAttribute("loginUser");
		int user_idx = 0;
		
		if(loginUser==null) {
			User kakaoUser = (User)s.getAttribute("kakaoUser");
			
			if(kakaoUser!=null) {
				user_idx = kakaoUser.getUser_idx();
			}else {
				return 0;
			}
			
		}else {
			user_idx = loginUser.getUser_idx();
		}
		
		int count = followService.getCountAlarm(user_idx);
		
		return count;
	}
	
	
	//친구요청받은리스트-대기중
	@GetMapping("/requestedFollowList")
	@ResponseBody
	public List<User> requestedFollowList(HttpSession s) {
		
		User loginUser = (User)s.getAttribute("loginUser");
		int user_idx = 0;
		
		if(loginUser==null) {
			User kakaoUser = (User)s.getAttribute("kakaoUser");
			user_idx = kakaoUser.getUser_idx();
		}else {
			user_idx = loginUser.getUser_idx();
		}
		
		List<User> followList = followService.requestedFollowList(user_idx);
		
		return followList;
	}
	
	
	//친구요청리스트-승인
	@PostMapping("/acceptFollow")
	@ResponseBody
	public String acceptFollow(
			@RequestParam(value="user_idx_1") int user_idx_1,
			HttpSession s
			) {
		
		User loginUser = (User)s.getAttribute("loginUser");
		int user_idx = 0;
		
		if(loginUser==null) {
			User kakaoUser = (User)s.getAttribute("kakaoUser");
			user_idx = kakaoUser.getUser_idx();
		}else {
			user_idx = loginUser.getUser_idx();
		}
		
		
		Follow f = new Follow();
		f.setUser_idx_1(user_idx_1);
		f.setUser_idx_2(user_idx);
		
		followService.acceptFollow(f);
		
		return "ok";
	}
	
	
	//친구요청리스트-거절
	@PostMapping("/rejectFollow")
	@ResponseBody
	public String rejectFollow(
			@RequestParam(value="user_idx_1") int user_idx_1,
			HttpSession s
			) {
		
		User loginUser = (User)s.getAttribute("loginUser");
		int user_idx = 0;
		
		if(loginUser==null) {
			User kakaoUser = (User)s.getAttribute("kakaoUser");
			user_idx = kakaoUser.getUser_idx();
		}else {
			user_idx = loginUser.getUser_idx();
		}
		
		
		Follow f = new Follow();
		f.setUser_idx_1(user_idx_1);
		f.setUser_idx_2(user_idx);
		
		followService.rejectFollow(f);
	
		return "ok";
	}
	
	
	//친구삭제
	@PostMapping("/delFollow")
	@ResponseBody
	public String delFollow(
			@RequestParam(value="user_idx_1") int user_idx_1,
			HttpSession s
			) {
		
		User loginUser = (User)s.getAttribute("loginUser");
		int user_idx = 0;
		
		if(loginUser==null) {
			User kakaoUser = (User)s.getAttribute("kakaoUser");
			user_idx = kakaoUser.getUser_idx();
		}else {
			user_idx = loginUser.getUser_idx();
		}
		
		Follow f = new Follow();
		f.setUser_idx_1(user_idx);
		f.setUser_idx_2(user_idx_1);
		
		followService.delFollow(f);
		
		return "ok";
	}
}
