package com.my.trip_scheduler.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.trip_scheduler.dao.TotalPriceDao;
import com.my.trip_scheduler.vo.TotalPrice;

@Service
public class TotalPriceService {

	@Autowired
	TotalPriceDao tpDao;
	
	public int addTotal(TotalPrice tp) {
		return tpDao.addTotal(tp);
	}
	
	public int updateTotal(TotalPrice tp) {
		return tpDao.updateTotal(tp);
	}
	
	public TotalPrice getTotal(int idx) {
		return tpDao.getTotal(idx);
	}
	
	public int delTotal(int idx) {
		return tpDao.delTotal(idx);
	}
}
