package com.my.trip_scheduler.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public List<String> getFollow(HttpSession s){
		
		Follow fl = new Follow();
		
		User loginUser = (User)s.getAttribute("loginUser");
		int user_idx = loginUser.getUser_idx();
		
		fl.setUser_idx_1(user_idx);
		fl.setUser_idx_2(user_idx);
		
		List<String> flList = followService.getFollow(fl);
		
		if(flList==null) {
			return null;
		}else {
			return flList;
		}
		
	}
}
