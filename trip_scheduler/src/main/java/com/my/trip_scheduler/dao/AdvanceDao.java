package com.my.trip_scheduler.dao;

import java.util.List;

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
	
	public List<Advance> getAdvance(int sm_idx){
		return s.selectList("advance.getAdvance", sm_idx);
	}
	
	public int delAd(int ad_idx) {
		return s.delete("advance.delAd", ad_idx);
	}
	
	public int delAdBySmIdx(int idx) {
		return s.delete("advance.delAdBySmIdx",idx);
	}
}
