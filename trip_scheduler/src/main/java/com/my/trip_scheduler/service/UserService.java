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
	
	public String getUserById(String id) {
		return userDao.getUserById(id);
	}
	
	public String getUserByNick(String nick) {
		return userDao.getUserByNick(nick); 
	}
}
