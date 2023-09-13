package com.my.trip_scheduler.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.trip_scheduler.vo.Summary;
import com.my.trip_scheduler.vo.SummaryFollow;


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
	
	public Summary getAllList(int idx) {
		return s.selectOne("summary.getAllList",idx);
	}
	
}
