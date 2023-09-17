package com.my.trip_scheduler.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.trip_scheduler.vo.TotalPrice;

@Repository
public class TotalPriceDao {

	@Autowired
	SqlSession s;
	
	public int addTotal(TotalPrice tp) {
		return s.insert("totalPrice.addTotal", tp);	
	}
	
	public int updateTotal(TotalPrice tp) {
		return s.update("totalPrice.updateTotal", tp);
	}
	
	public TotalPrice getTotal(int idx) {
		return s.selectOne("totalPrice.getTotal",idx);
	}
	
	public int delTotal(int idx) {
		return s.delete("totalPrice.delTotal",idx);
	}
}
