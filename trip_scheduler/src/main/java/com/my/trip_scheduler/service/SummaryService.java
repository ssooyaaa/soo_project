package com.my.trip_scheduler.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.trip_scheduler.dao.SummaryDao;
import com.my.trip_scheduler.vo.Summary;
import com.my.trip_scheduler.vo.SummaryFollow;

@Service
public class SummaryService {

	@Autowired
	SummaryDao summaryDao;
	
	public int addSummary(Summary sum) {
		return summaryDao.addSummary(sum);
	}
	
	public Summary getSummary(int idx) {
		return summaryDao.getSummary(idx);
	}
	
	public Summary getAllList(int idx) {
		return summaryDao.getAllList(idx);
	}
	
	public int getCountAllList(int idx) {
		return summaryDao.getCountAllList(idx);
	}
	
	public int delSmBySmIdx(int idx) {
		return summaryDao.delSmBySmIdx(idx);
	}
}
