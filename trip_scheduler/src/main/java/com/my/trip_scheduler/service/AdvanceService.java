package com.my.trip_scheduler.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.trip_scheduler.dao.AdvanceDao;
import com.my.trip_scheduler.vo.Advance;

@Service
public class AdvanceService {

	@Autowired
	AdvanceDao advanceDao;
	
	public int addAdvance(Advance ad) {
		return advanceDao.addAdvance(ad);
	}
}
