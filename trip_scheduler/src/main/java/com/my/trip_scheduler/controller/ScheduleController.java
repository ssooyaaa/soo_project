package com.my.trip_scheduler.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.trip_scheduler.service.AdvanceService;
import com.my.trip_scheduler.service.MemoService;
import com.my.trip_scheduler.service.PlanService;
import com.my.trip_scheduler.service.SummaryFollowService;
import com.my.trip_scheduler.service.SummaryService;
import com.my.trip_scheduler.service.UserService;
import com.my.trip_scheduler.vo.Advance;
import com.my.trip_scheduler.vo.Memo;
import com.my.trip_scheduler.vo.Plan;
import com.my.trip_scheduler.vo.Summary;
import com.my.trip_scheduler.vo.SummaryFollow;
import com.my.trip_scheduler.vo.User;

@Controller
@RequestMapping(value="/schedule")
public class ScheduleController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	SummaryService summaryService;
	
	@Autowired
	SummaryFollowService smflService;
	
	@Autowired
	AdvanceService advanceService;
	
	@Autowired
	PlanService planService;
	
	@Autowired
	MemoService memoService;
	
	
	//새일정짜기-summary-친구추가 
	@PostMapping("/getUserByIdx")
	@ResponseBody
	public List<User> getUserByIdx(
			@RequestBody List<Integer> list
			) {
		
		List<User> userList = new ArrayList<>();
		
		if(list.size()==0) {
			return null;
		}else {
			for(int i=0;i<list.size();i++) {
				
				User user = new User();
				user.setUser_idx(list.get(i));
				
				User getUser = userService.getUserByIdx(user);
				
				userList.add(getUser);
			}
			return userList;
		}
		
	}
	
	
	//새일정짜기-summary
	@Transactional
	@PostMapping("/addSummary")
	@ResponseBody
	public int addSummary(
			@RequestBody Map<String, Object> map,
			HttpSession s,
			Model m
			) {
		
		String name = (String)map.get("name");
		String start_date = (String)map.get("start_date");
		String end_date = (String)map.get("end_date");
		int days = (Integer)map.get("days");
		
		List<Integer> userList = (List<Integer>)map.get("userList");
		
		Summary newSummary = new Summary();
		newSummary.setName(name);
		newSummary.setStart_date(start_date);
		newSummary.setEnd_date(end_date);
		newSummary.setDays(days);
		
		summaryService.addSummary(newSummary);
		
		//summary테이블 먼저 저장 후, idx가져옴
		int new_sm_idx = newSummary.getSm_idx();
		
		User loginUser = (User)s.getAttribute("loginUser");
		int user_idx = loginUser.getUser_idx();
		
		for(int i=0;i<userList.size();i++) {
			SummaryFollow newSF = new SummaryFollow();
			int user_idx_2 = userList.get(i);
			
			newSF.setSm_idx(new_sm_idx);
			newSF.setUser_idx_1(user_idx);
			newSF.setUser_idx_2(user_idx_2);
			
			smflService.addSmFl(newSF);
		}
		
		return new_sm_idx;
	}
	
	
	//일정짜기-mainTitle가져오기+저장된내용
	@Transactional
	@GetMapping("/getSummary")
	@ResponseBody
	public Map<String, Object> getSummary(
			@RequestParam(value="sm_idx") int sm_idx
			) {
		
		Map<String, Object> map = new HashMap<>();
		
		
		//summary
		Summary summary = summaryService.getSummary(sm_idx);
		map.put("summary", summary);
		
		
		//일정 관련된 친구 가져오기
		List<SummaryFollow> smfl = smflService.getSmFl(sm_idx);
		List<Integer> list = new ArrayList<>();
		
		for(int i=0;i<smfl.size();i++) {
			int user_idx_1 = smfl.get(i).getUser_idx_1();
			int user_idx_2 = smfl.get(i).getUser_idx_2();
			
			list.add(user_idx_1);
			list.add(user_idx_2);
			
		}
		
		Set<Integer> userIdx = new HashSet<>(list);
		List<Integer> userIdxList = new ArrayList<>(userIdx);
		
		List<String> userIdList = new ArrayList<>();
		
		for(int i=0;i<userIdxList.size();i++) {
			int user_idx = userIdxList.get(i);
			
			User user = new User();
			user.setUser_idx(user_idx);
			
			User getUser = userService.getUserByIdx(user);
			userIdList.add(getUser.getId());
		}
		
		map.put("userIdList", userIdList);
		
		
		//사전경비 리스트 가져오기
		List<Advance> adList = advanceService.getAdvance(sm_idx);
		map.put("adList", adList);
		
		
		//일정가져오기
		List<Plan> planList = planService.getPlan(sm_idx);
		map.put("planList", planList);
				
		
		return map;
				
		
	}

	
	//사전경비추가
	@PostMapping("/addAdvance")
	@ResponseBody
	public Integer addAdvance(
			@RequestParam(value="sm_idx") int sm_idx,
			@RequestParam(value="item") String item,
			@RequestParam(value="price_type") String price_type,
			@RequestParam(value="price") int price
			) {
		
		Advance ad = new Advance();
		
		ad.setSm_idx(sm_idx);
		ad.setItem(item);
		ad.setPrice_type(price_type);
		ad.setPrice(price);
		
		
		advanceService.addAdvance(ad);
		
		//advance저장 후, idx가져오기
		int ad_idx = ad.getAd_idx();
		
		return ad_idx;
	}
	
	
	//사전경비삭제
	@PostMapping("/delAd")
	@ResponseBody
	public String delAd(
			@RequestParam(value="ad_idx") int ad_idx
			) {
		
		advanceService.delAd(ad_idx);
		
		return "ok";
	}
	
	
	//일정추가
	@PostMapping("addPlan")
	@ResponseBody
	public int addPlan(
			@RequestParam(value="sm_idx") int sm_idx,
			@RequestParam(value="day") int day,
			@RequestParam(value="start_time") String start_time,
			@RequestParam(value="end_time") String end_time,
			@RequestParam(value="todo") String todo,
			@RequestParam(value="priceType") String priceType,
			@RequestParam(value="price") int price
			) {
		
		Plan newP = new Plan();
		
		newP.setSm_idx(sm_idx);
		newP.setDay(day);
		newP.setStart_time(start_time);
		newP.setEnd_time(end_time);
		newP.setTodo(todo);
		newP.setPriceType(priceType);
		newP.setPrice(price);
		
		planService.addPlan(newP);
		
		int plan_idx = newP.getPlan_idx();
		
		return plan_idx;
	}
	
	
	//일정수정
	@PostMapping("/updatePlan")
	@ResponseBody
	public String updatePlan(
			@RequestParam(value="plan_idx") int plan_idx,
			@RequestParam(value="start_time") String start_time,
			@RequestParam(value="end_time") String end_time,
			@RequestParam(value="todo") String todo,
			@RequestParam(value="priceType") String priceType,
			@RequestParam(value="price") int price
			) {
		
		Plan p = new Plan();
		
		p.setPlan_idx(plan_idx);
		p.setStart_time(start_time);
		p.setEnd_time(end_time);
		p.setTodo(todo);
		p.setPriceType(priceType);
		p.setPrice(price);
		
		planService.updatePlan(p);
		
		return "ok";
	}
	
	
	//일정삭제
	@PostMapping("/delPlan")
	@ResponseBody
	public String delPlan(
			@RequestParam(value="plan_idx") int plan_idx
			) {
		
		planService.delPlan(plan_idx);
		
		return "ok";
	}
	
	
	//메모추가
	@PostMapping("/addMemo")
	@ResponseBody
	public Map<String, Object> addMemo(
			@RequestParam(value="sm_idx") int sm_idx,
			@RequestParam(value="day") int day,
			@RequestParam(value="content") String content,
			HttpSession s
			) {
		
		Map<String, Object> map = new HashMap<>();
		
		Memo newM = new Memo();
		newM.setSm_idx(sm_idx);
		newM.setDay(day);
		newM.setContent(content);
		
		User loginUser = (User)s.getAttribute("loginUser");
		String loginId = loginUser.getId();
		
		newM.setId(loginId);
		
		memoService.addMemo(newM);
		
		int memo_idx = newM.getMemo_idx();
		
		map.put("id", loginId);
		map.put("memo_idx", memo_idx);
		
		return map;
	}
	
}
