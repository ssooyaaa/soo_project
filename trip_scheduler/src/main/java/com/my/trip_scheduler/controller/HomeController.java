package com.my.trip_scheduler.controller;

import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.my.trip_scheduler.service.UserService;
import com.my.trip_scheduler.vo.KakaoProfile;
import com.my.trip_scheduler.vo.OAuthToken;
import com.my.trip_scheduler.vo.User;

@Controller
public class HomeController {
	
	@Autowired
	UserService userService;
	
	//세션관리
	void setUserSession(HttpSession session, Model model) {
		User loginUser = (User)session.getAttribute("loginUser");
		model.addAttribute("loginUser",loginUser);
		
	}
	
	void setKakaoUserSession(HttpSession s, Model m) {
		User kakaoUser = (User)s.getAttribute("kakaoUser");
		m.addAttribute("kakaoUser", kakaoUser);
	}

	
	//홈화면
	@GetMapping("/")
	public String home(Model m) {
		
		m.getAttribute("loginUser");
		
		m.getAttribute("kakaoUser");
		
		return "home";
	}
	
	
	//카카오로그인
	@GetMapping("/auth/kakao/callback")
	public String kakaoCallback(String code, HttpSession s) {
		
		//POST방식으로 key=value 데이터 요청(카카오쪽으로)
		//Retrofit2(라이브러리)-안드로이드에 많이 사용
		//OkHttp(라이브러리)
		//RestTemplate(라이브러리)
		RestTemplate rt = new RestTemplate();
		
		//HttpHeader 오브젝트 생성
		HttpHeaders headers = new HttpHeaders();
		
		//Body Type이 key-value형태임을 알려줌
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		//HttpBody 오브젝트 생성
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "096241bf30c19b1881244ce03b3292fe");
		params.add("redirect_url", "http://localhost:8080/trip_scheduler/auth/kakao/callback");
		params.add("code", code);
		
		//HttpHeader와 HttpBody를 하나의 오브젝트에 담기
		//엔티티(헤더값)
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest =
				new HttpEntity<>(params, headers);
		
		//Http요청하기 - POST방식으로 - response 변수의 응답 받음
		//요청(토큰발급주소/요청메서드/헤더값/응답받을타입)
		ResponseEntity<String> response = rt.exchange(
				"https://kauth.kakao.com/oauth/token",
				HttpMethod.POST,
				kakaoTokenRequest,
				String.class
		);
		
		//Gson,Json Simple, ObjectMapper(라이브러리)
		ObjectMapper obMapper = new ObjectMapper(); //기본적으로 내장
		OAuthToken oauthToken = null;
		
		try {
			oauthToken = obMapper.readValue(response.getBody(), OAuthToken.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		System.out.println("카카오 엑세스 토큰 : "+oauthToken.getAccess_token());
		
////////////////////////////////////////////////////////////////////////////////////////////		
		RestTemplate rt2 = new RestTemplate();
		
		//HttpHeader 오브젝트 생성
		HttpHeaders headers2 = new HttpHeaders();
		
		//Body Type이 key-value형태임을 알려줌
		headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		headers2.add("Authorization", "Bearer "+oauthToken.getAccess_token());
		
		//HttpHeader와 HttpBody를 하나의 오브젝트에 담기
		//엔티티(헤더값)
		HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest =
				new HttpEntity<>(headers2);
		
		//Http요청하기 - POST방식으로 - response 변수의 응답 받음
		//요청(토큰발급주소/요청메서드/헤더값/응답받을타입)
		ResponseEntity<String> response2 = rt2.exchange(
				"https://kapi.kakao.com/v2/user/me",
				HttpMethod.POST,
				kakaoProfileRequest,
				String.class
		);
		
		ObjectMapper obMapper2 = new ObjectMapper(); //기본적으로 내장
		KakaoProfile kakaoProfile = null;
		
		try {
			kakaoProfile = obMapper2.readValue(response2.getBody(), KakaoProfile.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		//User오브젝트 : id, password, email, nickname
		System.out.println("카카오 아이디(번호) : "+kakaoProfile.getId());
		System.out.println("카카오 이메일 : "+kakaoProfile.getKakao_account().getEmail());
		System.out.println("카카오 닉네임 : "+kakaoProfile.getKakao_account().getProfile().getNickname());
		
//////////////////////////////////////////////////////////////////////////////////////////////////////////		
		System.out.println("사이트서버 유저네임 : "+kakaoProfile.getKakao_account().getEmail());
		System.out.println("사이트서버 이메일 : "+kakaoProfile.getKakao_account().getEmail());
		System.out.println("카카오 닉네임 : "+kakaoProfile.getKakao_account().getProfile().getNickname());
		UUID garbagePassword = UUID.randomUUID();//임시 pw
		System.out.println("사이트서버 패스워드 : "+garbagePassword);
		
		User user = new User();
		user.setId(kakaoProfile.getKakao_account().getEmail());
		user.setPw(garbagePassword.toString());
		user.setNickname(kakaoProfile.getKakao_account().getProfile().getNickname());
		user.setEmail(kakaoProfile.getKakao_account().getEmail());
		
		//가입자 or 비가입자 체크해서 처리
		User kakaoUser = userService.getUserById(kakaoProfile.getKakao_account().getEmail());
		
		if(kakaoUser==null) {
			userService.addUser(user);
		}
		
		//로그인 처리
		User getKakaoUser = userService.kakaoLogin(kakaoProfile.getKakao_account().getEmail());
		s.setAttribute("kakaoUser", getKakaoUser);
		
		return "redirect:/";
	}
	
	
	//새일정짜기
	@GetMapping("/newTitle")
	public String newTitle(HttpSession s) {
		
		User loginUser = (User)s.getAttribute("loginUser");
		User kakaoUser = (User)s.getAttribute("kakaoUser");
		
		if(loginUser==null && kakaoUser==null) {
			return "redirect:/login";
		}else {
			return "newTitle";
		}
		
	}
	
	
	//새일정짜기-리스트 작성
	@GetMapping("/newList")
	public String newList(
			@RequestParam(value="sm_idx") int sm_idx,
			Model m
			//HttpSession s
			) {
		
		m.addAttribute("sm_idx",sm_idx);
		
		/*
		 * User loginUser = (User)s.getAttribute("loginUser"); String id =
		 * loginUser.getId();
		 * 
		 * m.addAttribute("userId", id);
		 * 
		 */
		return "newList";
	}
	
	
	//여행리스트
	@GetMapping("/allList")
	public String allList(HttpSession s, Model m) {
		
		User loginUser = (User)s.getAttribute("loginUser");
		User kakaoUser = (User)s.getAttribute("kakaoUser");
		
		m.getAttribute("loginUser");
		m.getAttribute("kakaoUser");
		
		if(loginUser==null && kakaoUser==null) {
			return "redirect:/login";
		}else {
			return "allList";
		}
		
	}
	
	//여행경비
	@GetMapping("/tripExpenses")
	public String tripExpenses(HttpSession s, Model m) {
		
		User loginUser = (User)s.getAttribute("loginUser");
		m.getAttribute("loginUser");
		
		User kakaoUser = (User)s.getAttribute("kakaoUser");
		m.getAttribute("kakaoUser");
		
		if(loginUser==null && kakaoUser==null) {
			return "redirect:/login";
		}else {
			return "tripExpenses";
		}
		
	}
	
	
	//여행경비-영수증
	@GetMapping("/receipt")
	public String receipt(
			@RequestParam(value="sm_idx") int sm_idx,
			Model m
			) {
		
		m.addAttribute("sm_idx",sm_idx);
		
		return "receipt";
	}
	
	
	//로그인
	@GetMapping("/login")
	public String login() {
		
		return "login";
	}
	
	
	//회원가입
	@GetMapping("/join")
	public String join() {
		
		return "join";
	}
	
	
	//비밀번호재설정
	@GetMapping("/pwReset")
	public String pwReset() {
		
		return "pwReset";
	}
	
	
	//친구관리-친구리스트
	@GetMapping("/memberList")
	public String memberList() {
		
		return "memberList";
	}
	
	
	//친구관리-알림
	@GetMapping("/memberAlarm")
	public String memberAlarm() {
		
		return "memberAlarm";
	}
	
}
