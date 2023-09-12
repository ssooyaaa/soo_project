package com.my.trip_scheduler.service;

import java.util.List;

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
	
	public List<Plan> getPlan(int idx){
		return planDao.getPlan(idx);
	}
	
	public int updatePlan(Plan p) {
		return planDao.updatePlan(p);
	}
}
