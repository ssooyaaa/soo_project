package com.my.trip_scheduler.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.trip_scheduler.service.SummaryService;
import com.my.trip_scheduler.service.UserService;
import com.my.trip_scheduler.vo.Summary;
import com.my.trip_scheduler.vo.User;

@Controller
@RequestMapping(value="/schedule")
public class ScheduleController {
	
	@Autowired
	UserService userService;
	SummaryService summaryService;
	
	
	//새일정짜기-summary-친구추가 
	@PostMapping("/getUserByIdx")
	@ResponseBody
	public List<User> getUserByIdx(
			@RequestBody List<Integer> list
			) {
		
		List<User> userList = new ArrayList<>();
		
		if(list.size()==0) {
			return null;
		}else {
			for(int i=0;i<list.size();i++) {
				
				User user = new User();
				user.setUser_idx(list.get(i));
				
				User getUser = userService.getUserByIdx(user);
				
				userList.add(getUser);
			}
			return userList;
		}
		
	}
	
	
	//새일정짜기-summary
	@Transactional
	@PostMapping("/addSummary")
	@ResponseBody
	public String addSummary(
			@RequestParam(value="title") String name,
			@RequestParam(value="start") String start_date,
			@RequestParam(value="end") String end_date,
			Model model
			) {
		
		//summary테이블 먼저 저장 후, idx가져옴
		
		Summary newSum = new Summary();
		newSum.setName(name);
		newSum.setStart_date(start_date);
		newSum.setEnd_date(end_date);
		
		
		return "ok";
	}

}
