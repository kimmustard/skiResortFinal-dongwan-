package com.web.www.oauth;


import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.expression.ParseException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.web.www.domain.member.OauthMemberVO;
import com.web.www.handler.OauthParser;
import com.web.www.security.OauthCustomMember;
import com.web.www.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("/oauth/*")
@RequiredArgsConstructor
public class OauthLoginController {

	private final MemberService msv;
	
	/**
	 * @네이버
	 */
	private final NaverLoginBO naverLoginBO;
	private final OauthParser parser;

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
	public String callback(Model model, @RequestParam String code, @RequestParam String state, 
			HttpSession session, RedirectAttributes rttr) 
			throws IOException, org.json.simple.parser.ParseException{ 
	
		OAuth2AccessToken oauthToken; 
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		
		//1. 로그인 사용자 정보를 읽어온다..
		String apiResult = null;
		apiResult = naverLoginBO.getUserProfile(oauthToken);
		log.info("네이버 로그인 정보 = {}" , apiResult);		
		
		//JSON 유저 정보 파싱 -> 유저VO에 담기
		OauthMemberVO omvo = parser.naverUser(apiResult);
		log.info("네이버로그인 정보 = {}", omvo);	
		
		//DB에 소셜유저 검증
		if(msv.socialSearch(omvo.getMemberId()) == null) {
			int isOk = msv.socialRegister(omvo);
		}
		
		OauthCustomMember OauthUser =  new OauthCustomMember(omvo);
		
		Authentication authentication = 
				new UsernamePasswordAuthenticationToken(OauthUser, null, OauthUser.getAuthorities());
		SecurityContextHolder.getContext().setAuthentication(authentication);
		
		rttr.addAttribute("memberId", session.getAttribute("memberId"));
		rttr.addAttribute("memberEmail", session.getAttribute("memberEmail"));
		
		return "redirect:/"; 
		
	}
	
	//	로그아웃
	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })	
	public String logout(HttpSession session)throws IOException {			
		log.info("OAuth logout check !!!!");		
		session.invalidate(); 	        			
		return "redirect:/";
	}
	

}
