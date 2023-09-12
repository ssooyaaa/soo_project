package com.my.trip_scheduler.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.trip_scheduler.vo.Plan;

@Repository
public class PlanDao {

	@Autowired
	SqlSession s;
	
	public int addPlan(Plan plan) {
		return s.insert("plan.addPlan", plan);
	}
	
	public List<Plan> getPlan(int idx){
		return s.selectList("plan.getPlan", idx);
	}
	
	public int updatePlan(Plan p) {
		return s.update("plan.updatePlan", p);
	}
}
