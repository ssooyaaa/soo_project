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
	
	public User getUserById(String id) {
		return s.selectOne("user.getUserById",id);
	}
	
	public String getUserByNick(String nick) {
		return s.selectOne("user.getUserByNick",nick);
	}
	
	public User login(User user) {
		return s.selectOne("user.login",user);
	}
	
	public User kakaoLogin(String id) {
		return s.selectOne("user.kakaoLogin",id);
	}
	
	public User getUserByIdAndEmail(User user) {
		return s.selectOne("user.getUserByIdAndEmail",user);
	}
	
	public int resetPw(User user) {
		return s.update("user.resetPw",user);
	}
	
	public User getUserByIdx(User user) {
		return s.selectOne("user.getUserByIdx",user);
	}
}
