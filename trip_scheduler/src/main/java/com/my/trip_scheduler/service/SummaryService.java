package com.my.trip_scheduler.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.trip_scheduler.dao.SummaryDao;
import com.my.trip_scheduler.vo.Summary;

@Service
public class SummaryService {

	@Autowired
	SummaryDao summaryDao;
	
	public int addSummary(Summary sum) {
		return summaryDao.addSummary(sum);
	}
	
	public int addSmFl(Summary sum) {
		return summaryDao.addSmFl(sum);
	}
}
