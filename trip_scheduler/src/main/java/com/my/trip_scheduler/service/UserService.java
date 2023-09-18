package com.my.trip_scheduler.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.trip_scheduler.dao.UserDao;
import com.my.trip_scheduler.vo.User;

@Service
public class UserService {

	@Autowired
	UserDao userDao;
	
	public int addUser(User user) {
		return userDao.addUser(user);
	}
	
	public User getUserById(String id) {
		return userDao.getUserById(id);
	}
	
	public String getUserByNick(String nick) {
		return userDao.getUserByNick(nick); 
	}
	
	public User login(User user) {
		return userDao.login(user);
	}
	
	public User kakaoLogin(String id) {
		return userDao.kakaoLogin(id);
	}
	
	public User getUserByIdAndEmail(User user) {
		return userDao.getUserByIdAndEmail(user);
	}
	
	public int resetPw(User user) {
		return userDao.resetPw(user);
	}
	
	public User getUserByIdx(User user) {
		return userDao.getUserByIdx(user);
	}
}
