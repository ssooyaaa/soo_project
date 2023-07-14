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
	
	public List<String> getFollow(Follow f){
		return s.selectList("follow.getFollow",f);
	}
}
