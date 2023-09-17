package com.my.trip_scheduler.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.trip_scheduler.vo.Exchange;

@Repository
public class ExchangeDao {

	@Autowired
	SqlSession s;
	
	public int addExchange(Exchange e) {
		return s.insert("exchange.addExchange", e);
	}
	
	public List<Exchange> getExchange(int idx){
		return s.selectList("exchange.getExchange", idx);
	}
	
	public int delExchange(int idx) {
		return s.delete("exchange.delExchange", idx);
	}
	
	public int delExchangeByDelAll(int idx) {
		return s.delete("exchange.delExchangeByDelAll", idx);
	}
}
