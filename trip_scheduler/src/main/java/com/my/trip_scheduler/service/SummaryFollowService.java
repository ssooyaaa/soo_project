package com.my.trip_scheduler.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.trip_scheduler.dao.SummaryFollowDao;
import com.my.trip_scheduler.vo.SummaryFollow;

@Service
public class SummaryFollowService {

	@Autowired
	SummaryFollowDao smflDao;
	
	public int addSmFl(SummaryFollow sf) {
		return smflDao.addSmFl(sf);
	}
	
	public List<SummaryFollow> getSmFl(int idx){
		return smflDao.getSmFl(idx);
	}
	
	public List<SummaryFollow> getSummaryIdx(SummaryFollow sf){
		return smflDao.getSummaryIdx(sf);
	}
	
	public int delSmFlBySmIdx(int idx) {
		return smflDao.delSmFlBySmIdx(idx);
	}
}
