package com.my.trip_scheduler.service;

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
}
