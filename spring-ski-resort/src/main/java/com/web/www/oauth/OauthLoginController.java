package com.web.www.oauth;


import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.expression.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.web.www.handler.OauthParser;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("/oauth/*")
@RequiredArgsConstructor
public class OauthLoginController {

	/**
	 * @네이버
	 */
	private final NaverLoginBO naverLoginBO;


	// 로그인 첫 화면 요청 메소드
	@ResponseBody
	@GetMapping("/naver/login") 
	public String login(HttpSession session) { 
		
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */ 
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		log.info("네이버 url = {}" , naverAuthUrl); //네이버 
		return naverAuthUrl; 
	 }

	// 네이버 로그인 성공시 callback호출 메소드 
	
	@RequestMapping(value = "/naver/callback", method = {RequestMethod.GET, RequestMethod.POST }) 
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) 
			throws IOException, org.json.simple.parser.ParseException{ 
		
		 log.info("callback check !!!!!!!!!!");
			
		 OAuth2AccessToken oauthToken; 
		 oauthToken = naverLoginBO.getAccessToken(session, code, state);
		 
		 //1. 로그인 사용자 정보를 읽어온다..
		 String apiResult = null;
		 apiResult = naverLoginBO.getUserProfile(oauthToken);
		 log.info("네이버 로그인 정보 = {}" , apiResult);
		 
		 //String형식의 json데이터 /**apiResult json 구조 {"resultcode":"00", "message":"success","response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}**/ 
		

		 OauthParser user = new OauthParser(apiResult);
		 log.info("id = {}", user.getId());
		 log.info("alias = {}", user.getAlias());
		 log.info("name = {}", user.getName());
		 log.info("phoneNum = {}", user.getPhoneNum());
		 log.info("email = {}", user.getEmail());
		 
//		 //4.파싱 닉네임 세션으로 저장
//		 session.setAttribute("sessionId", id); 
//		 //세션 생성
//		 model.addAttribute("result", apiResult); 
		 
		 return "index"; 
		 
	 }
	
	//로그아웃
//	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })	
//	public String logout(HttpSession session)throws IOException {			
//		System.out.println("여기는 logout");			
//		session.invalidate(); 	        			
//		return "redirect:index.jsp";		
//	}
	

}
