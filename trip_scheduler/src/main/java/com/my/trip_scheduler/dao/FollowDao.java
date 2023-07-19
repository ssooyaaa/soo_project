package com.my.trip_scheduler.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.trip_scheduler.vo.Follow;
import com.my.trip_scheduler.vo.User;

@Repository
public class FollowDao {

	@Autowired
	SqlSession s;
	
	public List<User> getFollow(Follow f){
		return s.selectList("follow.getFollow",f);
	}
	
	public int requestFollow(Follow f) {
		return s.insert("follow.requestFollow",f);
	}
	
	public User checkUserOne(Follow f) {
		return s.selectOne("follow.checkUserOne",f);
	}
	
	public User checkUserTwo(Follow f) {
		return s.selectOne("follow.checkUserTwo",f);
	}
	
	public int getCountAlarm(int idx) {
		return s.selectOne("follow.getCountAlarm",idx);
	}
	
	public List<User> requestedFollowList(int idx){
		return s.selectList("follow.requestedFollowList",idx);
	}
	
	public int acceptFollow(Follow f) {
		return s.update("follow.acceptFollow",f);
	}
}

