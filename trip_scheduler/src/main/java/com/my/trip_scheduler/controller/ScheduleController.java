package com.my.trip_scheduler.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.trip_scheduler.service.UserService;
import com.my.trip_scheduler.vo.User;

@Controller
@RequestMapping(value="/schedule")
public class ScheduleController {
	
	@Autowired
	UserService userService;
	
	@GetMapping("/getUserByIdx")
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

}
