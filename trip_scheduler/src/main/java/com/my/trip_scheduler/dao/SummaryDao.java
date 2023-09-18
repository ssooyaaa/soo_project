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
	
	public Summary getAllList(int idx) {
		return s.selectOne("summary.getAllList",idx);
	}
	
	public int getCountAllList(int idx) {
		return s.selectOne("summary.getCountAllList",idx);
	}
	
	public int delSmBySmIdx(int idx) {
		return s.delete("summary.delSmBySmIdx",idx);
	}
}
