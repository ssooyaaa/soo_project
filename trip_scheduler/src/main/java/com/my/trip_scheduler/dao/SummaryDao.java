package com.my.trip_scheduler.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.trip_scheduler.vo.Summary;


@Repository
public class SummaryDao {

	@Autowired
	SqlSession s;
	
	public int addSummary(Summary sum) {
		return s.insert("summary.addSummary",sum);
	}
	
	public Summary getSummary(int idx) {
		return s.selectOne("summary.getSummary",idx);
	}
}
