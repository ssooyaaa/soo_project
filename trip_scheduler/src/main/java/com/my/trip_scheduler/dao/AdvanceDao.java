package com.my.trip_scheduler.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.trip_scheduler.vo.Advance;

@Repository
public class AdvanceDao {

	@Autowired
	SqlSession s;
	
	public int addAdvance(Advance ad) {
		return s.insert("advance.addAdvance", ad);
	}
	
}
