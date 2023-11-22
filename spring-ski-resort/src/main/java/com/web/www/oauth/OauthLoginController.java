package com.web.www.oauth;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.impl.GoogleTemplate;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
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
import com.web.www.security.AuthMember;
import com.web.www.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("/oauth/*")
@PropertySource("classpath:OAuthProperties.properties")
@RequiredArgsConstructor
public class OauthLoginController {

	private final MemberService msv;
	//OauthParser
	private final OauthParser parser;
	
	/**
	 * @네이버
	 * @카카오
	 */
	private final NaverLoginBO naverLoginBO;
	private final KakaoLoginBO kakaoLoginBO;
	private final GoogleLoginBO googleLoginBO;
	

	// 로그인 첫 화면 요청 메소드
	@ResponseBody
	@GetMapping("/naver/login") 
	public String naverLogin(HttpSession session) { 
		
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
	
		OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state);
		
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
		//정보가 세팅된 소셜유저 가입, 인증권한 세팅 메서드 
		socialUserCreateMemberAndAuthSet(mvo);
		
		return "redirect:/"; 
		
	}
	
	/**
	 * @카카오
	 */
	
	@Value("${oauth.kakao.url}")
	private String clientUrl;
	
	
	// 로그인 첫 화면 요청 메소드
	@ResponseBody
	@GetMapping("/kakao/login") 
	public String kakaoLogin() { 
		
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */ 
		String kakaoAuthUrl = clientUrl;
		log.info("카카오 url = {}" , kakaoAuthUrl); //네이버 
		return kakaoAuthUrl; 
	 }
	
	@GetMapping("/kakao/callback")
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Exception {
		String access_Token = kakaoLoginBO.getAccessToken(code);
        
		// JSON 유저 정보 파싱 -> 유저VO에 담기
		MemberVO mvo = parser.kakaoUser(access_Token);
		if(mvo == null) {
			log.info("카카오 소셜 mvo가 생성되지 않았습니다. Oauth Controller 코드를 확인 해주세요");
			return "redirect:/";
		}

		//정보가 세팅된 소셜유저 가입, 인증권한 세팅 메서드
		socialUserCreateMemberAndAuthSet(mvo);
		
		return "redirect:/";
    	}
	
	/**
	 * @구글
	 */
	// 로그인 첫 화면 요청 메소드
	@ResponseBody
	@RequestMapping("/google/login")
	public String login() {
		//구글 code 발행
		String googleAuthUrl = googleLoginBO.getGoogleUrl();

		log.info("구글@@@@@@:" + googleAuthUrl);

		return googleAuthUrl;
	}

	// 구글 Callback호출 메소드
	@RequestMapping(value = "/google/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String googleCallback(Model model, @RequestParam String code) throws IOException {
	     // Step 1: Exchange authorization code for access token
		
		String access_Token = googleLoginBO.getAccessToken(code);
        Google google = new GoogleTemplate(access_Token);

        // Step 3: Use GoogleTemplate to get user information
        String[] fields = {"id", "email", "given_name", "family_name"};
        for (String str : fields) {
			log.info("정보1 = {}", str);
		}

        // Handle the user profile as needed
	    log.info("test@@@@@@@@@@@ = {}", access_Token);
		return "redirect:/";
	}



	
	

	
	//정보가 세팅된 소셜유저 가입, 인증권한 세팅 메서드 
	private void socialUserCreateMemberAndAuthSet(MemberVO mvo) {
		//DB에 소셜유저 검증 (없으면 DB에 저장 || 있으면 pass)
		if(msv.socialSearch(mvo.getMemberId()) == null) {
			int isOk = msv.socialRegister(mvo);
		}
		AuthMember OauthUser =  new AuthMember(mvo);
		Authentication authentication = 
				new UsernamePasswordAuthenticationToken(OauthUser, null, OauthUser.getAuthorities());
		SecurityContextHolder.getContext().setAuthentication(authentication);
	}
	
	
		
}	


