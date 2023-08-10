package com.my.trip_scheduler.dao;

import java.util.List;

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
	
	public List<SummaryFollow> getSmFl(int idx) {
		return s.selectList("sm_fl.getSmFl",idx);
	}
	
}
