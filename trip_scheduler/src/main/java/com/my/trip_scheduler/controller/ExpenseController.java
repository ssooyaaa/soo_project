package com.my.trip_scheduler.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.trip_scheduler.service.SummaryFollowService;
import com.my.trip_scheduler.service.SummaryService;
import com.my.trip_scheduler.service.UserService;
import com.my.trip_scheduler.vo.Summary;
import com.my.trip_scheduler.vo.SummaryFollow;
import com.my.trip_scheduler.vo.User;

@Controller
@RequestMapping(value="/expense")
public class ExpenseController {

	@Autowired
	SummaryService sService;
	
	@Autowired
	SummaryFollowService sfService;
	
	@Autowired
	UserService uService;
	
	
	//모든 일정가져오기
	@Transactional
	@GetMapping("/getAllExpense")
	@ResponseBody
	public List<Summary> getAllExpense(HttpSession s) {
		
		User loginUser = (User)s.getAttribute("loginUser");
		int user_idx = loginUser.getUser_idx();
		
		SummaryFollow sf = new SummaryFollow();
		sf.setUser_idx_1(user_idx);
		sf.setUser_idx_2(user_idx);
		
		
		List<SummaryFollow> smIdxList = sfService.getSummaryIdx(sf);
		
		Set<Integer> smIdx = new HashSet<>();
		List<Summary> allList = new ArrayList<>();
		
		
		for(int i=0;i<smIdxList.size();i++) {
			int sm_idx = smIdxList.get(i).getSm_idx();
			
			smIdx.add(sm_idx);
		}
		
		for(Iterator<Integer> it = smIdx.iterator(); it.hasNext();) {
			int sm_idx = it.next();
			
			Summary sm = sService.getAllList(sm_idx);
			allList.add(sm);
		}
		
		return allList;
	}
}
