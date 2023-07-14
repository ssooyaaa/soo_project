package com.my.trip_scheduler.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.trip_scheduler.dao.FollowDao;
import com.my.trip_scheduler.vo.Follow;
import com.my.trip_scheduler.vo.User;

@Service
public class FollowService {

	@Autowired
	FollowDao followDao;
	
	public List<String> getFollow(Follow f){
		return followDao.getFollow(f);
	}
}
