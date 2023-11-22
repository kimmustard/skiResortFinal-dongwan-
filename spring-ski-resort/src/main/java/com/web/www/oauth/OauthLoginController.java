package com.web.www.oauth;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

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
import com.web.www.domain.member.MemberVO;
import com.web.www.handler.OauthParser;
import com.web.www.security.AuthMember;
import com.web.www.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("/oauth/*")
@RequiredArgsConstructor
public class OauthLoginController {

	private final MemberService msv;
	//OauthParser
	private final OauthParser parser;
	
	/**
	 * @네이버
	 */
	private final NaverLoginBO naverLoginBO;
	
	/**
	 * @카카오
	 */
	private final KakaoLoginBO kakaoLoginBO;

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
		
		//로그인 사용자 정보를 읽어옵니다.
		String apiResult = null;
		apiResult = naverLoginBO.getUserProfile(oauthToken);
		log.info("네이버 로그인 정보 = {}" , apiResult);		
		
		//JSON 유저 정보 파싱 -> 유저VO에 담기
		MemberVO mvo = parser.naverUser(apiResult);
		log.info("네이버로그인 정보 = {}", mvo);	
		if(mvo == null) {
			log.info("네이버 소셜 mvo가 생성되지 않았습니다. Oauth Controller 코드를 확인 해주세요");
			return "redirect:/";
		}
		
		
		//DB에 소셜유저 검증 (없으면 DB에 저장 || 있으면 pass)
		if(msv.socialSearch(mvo.getMemberId()) == null) {
			int isOk = msv.socialRegister(mvo);
		}
		//네이버 회원 색인
		mvo.setMemberType("naver");
		AuthMember OauthUser =  new AuthMember(mvo);
		
		Authentication authentication = 
				new UsernamePasswordAuthenticationToken(OauthUser, null, OauthUser.getAuthorities());
		SecurityContextHolder.getContext().setAuthentication(authentication);
		
		return "redirect:/"; 
		
	}
	
	/**
	 * @카카오
	 */
	@RequestMapping(value="/kakao/callback", method=RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Exception {
		System.out.println("#########" + code);
		String access_Token = kakaoLoginBO.getAccessToken(code);
        
		// JSON 유저 정보 파싱 -> 유저VO에 담기
		MemberVO mvo = parser.kakaoUser(access_Token);
		if(mvo == null) {
			log.info("카카오 소셜 mvo가 생성되지 않았습니다. Oauth Controller 코드를 확인 해주세요");
			return "redirect:/";
		}
		
		//DB에 소셜유저 검증 (없으면 DB에 저장 || 있으면 pass)
		if(msv.socialSearch(mvo.getMemberId()) == null) {
			int isOk = msv.socialRegister(mvo);
		}
		//네이버 회원 색인
		mvo.setMemberType("kakao");
		AuthMember OauthUser =  new AuthMember(mvo);
		
		Authentication authentication = 
				new UsernamePasswordAuthenticationToken(OauthUser, null, OauthUser.getAuthorities());
		SecurityContextHolder.getContext().setAuthentication(authentication);
		
		return "redirect:/";
    	}
		
}	


