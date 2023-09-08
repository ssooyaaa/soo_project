package com.my.trip_scheduler.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.trip_scheduler.dao.PlanDao;
import com.my.trip_scheduler.vo.Plan;

@Service
public class PlanService {

	@Autowired
	PlanDao planDao;
	
	public int addPlan(Plan p) {
		return planDao.addPlan(p);
	}
}
