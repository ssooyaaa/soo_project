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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.trip_scheduler.service.SummaryFollowService;
import com.my.trip_scheduler.service.SummaryService;
import com.my.trip_scheduler.service.UserService;
import com.my.trip_scheduler.vo.Summary;
import com.my.trip_scheduler.vo.SummaryFollow;
import com.my.trip_scheduler.vo.User;

@Controller
@RequestMapping(value="/allList")
public class AllListController {
	
	@Autowired
	UserService uService;
	
	@Autowired
	SummaryFollowService sfService;
	
	@Autowired
	SummaryService smService;
	
	
	
	@Transactional
	@GetMapping("/getAllList")
	@ResponseBody
	public Map<String, Object> getAllList(HttpSession s) {
		
		Map<String, Object> map = new HashMap<>();
		
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
		
		//일정가져오기
		List<SummaryFollow> smIdxList = sfService.getSummaryIdx(sf);
		
		Set<Integer> smIdx = new HashSet<>();
		List<Summary> allList = new ArrayList<>();
		
		
		for(int i=0;i<smIdxList.size();i++) {
			int sm_idx = smIdxList.get(i).getSm_idx();
			
			smIdx.add(sm_idx);
		}
		
		Map<Integer, List<String>> userIdMap = new HashMap<>();
		
		for(Iterator<Integer> it = smIdx.iterator(); it.hasNext();) {
			int sm_idx = it.next();
			
			Summary sm = smService.getAllList(sm_idx);
			allList.add(sm);
			
			//관련 친구 가져오기
			Set<Integer> userIdx = new HashSet<>();
			List<String> getUserList = new ArrayList<>();
			
			List<SummaryFollow> smfl = sfService.getSmFl(sm_idx);
			for(int i=0;i<smfl.size();i++) {
				int user_idx_1 = smfl.get(i).getUser_idx_1();
				int user_idx_2 = smfl.get(i).getUser_idx_2();
				
				userIdx.add(user_idx_1);
				userIdx.add(user_idx_2);
			}
			
			for(Iterator<Integer> iter = userIdx.iterator(); iter.hasNext();) {
				int get_user_idx = iter.next();
				
				User user = new User();
				user.setUser_idx(get_user_idx);
				
				User u = uService.getUserByIdx(user);
				getUserList.add(u.getId());
			}
			
			userIdMap.put(sm_idx, getUserList);
			map.put("userIdMap", userIdMap);
		}
		
		map.put("allList", allList);
		
		return map;
	}
	
	
	//모든리스트 개수
	@GetMapping("/getCountAllList")
	@ResponseBody
	public int getCountAllList(HttpSession s) {
		
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
		
		//일정가져오기
		List<SummaryFollow> smIdxList = sfService.getSummaryIdx(sf);
		
		Set<Integer> smIdx = new HashSet<>();
		
		for(int i=0;i<smIdxList.size();i++) {
			int sm_idx = smIdxList.get(i).getSm_idx();
			
			smIdx.add(sm_idx);
		}
		
		return smIdx.size();
		
	}
}
