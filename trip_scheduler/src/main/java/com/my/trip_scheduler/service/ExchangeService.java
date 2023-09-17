package com.my.trip_scheduler.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.trip_scheduler.dao.ExchangeDao;
import com.my.trip_scheduler.vo.Exchange;

@Service
public class ExchangeService {

	@Autowired
	ExchangeDao eDao;
	
	public int addExchange(Exchange e) {
		return eDao.addExchange(e);
	}
	
	public List<Exchange> getExchange(int idx){
		return eDao.getExchange(idx);
	}
	
	public int delExchange(int idx) {
		return eDao.delExchange(idx);
	}
	
	public int delExchangeByDelAll(int idx) {
		return eDao.delExchangeByDelAll(idx);
	}
}
