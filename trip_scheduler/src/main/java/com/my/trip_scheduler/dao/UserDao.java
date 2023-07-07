package com.my.trip_scheduler.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.trip_scheduler.vo.User;

@Repository
public class UserDao {

	@Autowired
	SqlSession s;
	
	public int addUser(User user) {
		return s.insert("user.addUser",user);
	}
}
