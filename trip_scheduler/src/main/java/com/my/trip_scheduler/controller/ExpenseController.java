package com.my.trip_scheduler.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.trip_scheduler.service.AdvanceService;
import com.my.trip_scheduler.service.ExchangeService;
import com.my.trip_scheduler.service.PlanService;
import com.my.trip_scheduler.service.SummaryFollowService;
import com.my.trip_scheduler.service.SummaryService;
import com.my.trip_scheduler.service.TotalPriceService;
import com.my.trip_scheduler.service.UserService;
import com.my.trip_scheduler.vo.Advance;
import com.my.trip_scheduler.vo.Exchange;
import com.my.trip_scheduler.vo.Plan;
import com.my.trip_scheduler.vo.Summary;
import com.my.trip_scheduler.vo.SummaryFollow;
import com.my.trip_scheduler.vo.TotalPrice;
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
	
	@Autowired
	PlanService pService;
	
	@Autowired
	AdvanceService adService;
	
	@Autowired
	ExchangeService eService;
	
	@Autowired
	TotalPriceService tpService;
	
	
	//모든 일정가져오기
	@Transactional
	@GetMapping("/getAllExpense")
	@ResponseBody
	public HashMap<String, Object> getAllExpense(HttpSession s) {
		
		HashMap<String, Object> map = new HashMap<>();
		
		User loginUser = (User)s.getAttribute("loginUser");
		int user_idx = 0;
		
		if(loginUser==null) {
			User kakaoUser = (User)s.getAttribute("kakaoUser");
			user_idx = kakaoUser.getUser_idx();
		}else {
			user_idx = loginUser.getUser_idx();
		}
		
		SummaryFollow sf = new SummaryFollow();
		sf.setUser_idx_1(user_idx);
		sf.setUser_idx_2(user_idx);
		
		
		List<SummaryFollow> smIdxList = sfService.getSummaryIdx(sf);
		
		Set<Integer> smIdx = new HashSet<>();
		List<Summary> allList = new ArrayList<>();
		
		List<TotalPrice> tpList = new ArrayList<>();
		
		
		for(int i=0;i<smIdxList.size();i++) {
			int sm_idx = smIdxList.get(i).getSm_idx();
			
			smIdx.add(sm_idx);
		}
		
		for(Iterator<Integer> it = smIdx.iterator(); it.hasNext();) {
			int sm_idx = it.next();
			
			Summary sm = sService.getAllList(sm_idx);
			allList.add(sm);
			
			
			TotalPrice tp = tpService.getTotal(sm_idx);
			tpList.add(tp);
			
		}
		
		map.put("allList", allList);
		map.put("tpList", tpList);
		
		return map;
	}
	
	
	//해당 영수증 가져오기
	@Transactional
	@GetMapping(value="/getReceipt")
	@ResponseBody
	public HashMap<String, Object> getReceipt(
			@RequestParam(value="sm_idx") int sm_idx
			) {
		
		HashMap<String, Object> map = new HashMap<>();
		
		Summary s = sService.getSummary(sm_idx);
		map.put("summary", s);
		
		List<Exchange> exList = eService.getExchange(sm_idx);
		map.put("exchange", exList);
		
		List<Advance> adList = adService.getAdvance(sm_idx);
		map.put("advance", adList);
		
		List<Plan> pList = pService.getPlan(sm_idx);
		map.put("plan", pList);
		
		return map;
	}
	
	
	//환율 저장
	@Transactional
	@PostMapping("/addExchange")
	@ResponseBody
	public int addExchange(
			@RequestParam(value="sm_idx") int sm_idx,
			@RequestParam(value="exchange_type") String exchange_type,
			@RequestParam(value="exchange_rate") int exchange_rate
			) {
		
		Exchange newEx = new Exchange();
		
		newEx.setSm_idx(sm_idx);
		newEx.setExchange_type(exchange_type);
		newEx.setExchange_rate(exchange_rate);
		
		List<Exchange> eList = eService.getExchange(sm_idx);
		int ex_idx=0;
		
		if(eList.size()==0) {
			eService.addExchange(newEx);
			ex_idx = newEx.getExchange_idx();
		}else {
			for(int i=0;i<eList.size();i++) {
				if(eList.get(i).getExchange_type().equals(exchange_type)) {
					
					return -1;
				}else {
					
					eService.addExchange(newEx);
					ex_idx = newEx.getExchange_idx();
				}
			}
			
		}
		
		return ex_idx;
	}
	
	
	//환율 삭제
	@PostMapping("/delExchange")
	@ResponseBody
	public String delExchange(
			@RequestParam(value="exchange_idx") int exchange_idx
			) {
		
		eService.delExchange(exchange_idx);
		
		return "ok";
	}
	
	
	//총금액 수정
	@PostMapping("/updateTotal")
	@ResponseBody
	public String updateTotal(
			@RequestParam(value="sm_idx") int sm_idx,
			@RequestParam(value="total") String total
			) {
		
		TotalPrice tp = new TotalPrice();
		tp.setSm_idx(sm_idx);
		tp.setTotal(total);
		
		tpService.updateTotal(tp);
		
		return "ok";
	}
	
}
