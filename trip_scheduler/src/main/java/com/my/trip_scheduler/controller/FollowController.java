package com.my.trip_scheduler.controller;

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
		int user_idx = loginUser.getUser_idx();
		
		fl.setUser_idx_1(user_idx);
		fl.setUser_idx_2(user_idx);
		
		List<User> flList = followService.getFollow(fl);
		
		if(flList==null) {
			return null;
		}else {
			return flList;
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
		int user_idx_1 = loginUser.getUser_idx();
		
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
		int loginUserIdx = loginUser.getUser_idx();
		
		Follow f1 = new Follow();
		f1.setUser_idx_1(loginUserIdx);
		f1.setUser_idx_2(user_idx);
		
		User user1 = followService.checkUserOne(f1);
		
		Follow f2 = new Follow();
		f2.setUser_idx_1(user_idx);
		f2.setUser_idx_2(loginUserIdx);
		
		User user2 = followService.checkUserTwo(f2);
		
		
		if(user1==null && user2==null) {
			return null;
		}else if(user1==null) {
			return user2;
		}else{
			return user1;
		}
		
	}
}
