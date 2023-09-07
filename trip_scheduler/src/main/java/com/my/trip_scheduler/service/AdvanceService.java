package com.my.trip_scheduler.service;

import java.util.List;

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
	
	public List<Advance> getAdvance(int sm_idx){
		return advanceDao.getAdvance(sm_idx);
	}
	
	public int delAd(int ad_idx) {
		return advanceDao.delAd(ad_idx);
	}
}
