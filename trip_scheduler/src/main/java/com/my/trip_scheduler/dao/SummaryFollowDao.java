package com.my.trip_scheduler.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.trip_scheduler.vo.SummaryFollow;

@Repository
public class SummaryFollowDao {

	@Autowired
	SqlSession s;
	
	public int addSmFl(SummaryFollow sf) {
		return s.insert("sm_fl.addSmFl",sf);
	}
	
}
