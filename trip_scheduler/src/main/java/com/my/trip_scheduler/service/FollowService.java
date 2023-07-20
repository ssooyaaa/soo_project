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
	
	public List<User> getFollow(Follow f){
		return followDao.getFollow(f);
	}
	
	public int requestFollow(Follow f) {
		return followDao.requestFollow(f);
	}
	
	public User checkUserOne(Follow f) {
		return followDao.checkUserOne(f);
	}
	
	public User checkUserTwo(Follow f) {
		return followDao.checkUserTwo(f);
	}
	
	public int getCountAlarm(int idx) {
		return followDao.getCountAlarm(idx);
	}
	
	public List<User> requestedFollowList(int idx){
		return followDao.requestedFollowList(idx);
	}
	
	public int acceptFollow(Follow f) {
		return followDao.acceptFollow(f);
	}
	
	public int rejectFollow(Follow f) {
		return followDao.rejectFollow(f);
	}
	
	public int delFollow(Follow f) {
		return followDao.delFollow(f);
	}
}
