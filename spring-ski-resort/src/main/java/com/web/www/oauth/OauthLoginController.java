package com.web.www.oauth;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParser;
import com.github.scribejava.core.model.OAuth2AccessToken;

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
    private String apiResult = null;
    
    @RequestMapping("/navergo")
	public @ResponseBody String getNaverAuthUrl(HttpSession session) throws Exception {
	    String reqUrl = (new NaverLoginBO()).getAuthorizationUrl(session);
	    return reqUrl;
	}
	 

	// 네이버 연동정보 조회
	@RequestMapping(value = "/oauth_naver")
	public String oauthNaver(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    JsonParser parser = new JsonParser();
	    Gson gson = new Gson();

	    HttpSession session = request.getSession();
	    String code = request.getParameter("code");
	    String state = request.getParameter("state");
	    String error = request.getParameter("error");
	    
	    // 로그인 팝업창에서 취소버튼 눌렀을경우
	    if ( error != null ){
	        if(error.equals("access_denied")){
	            return "redirect:/login";
	        }
	    }

	    OAuth2AccessToken oauthToken;
	    oauthToken = new NaverLoginBO().getAccessToken(session, code, state);
	    //로그인 사용자 정보를 읽어온다.
	    String loginInfo = new NaverLoginBO().getUserProfile(session, oauthToken);
	    System.out.println(loginInfo);
	    // JSON 형태로 변환
	    Object obj = parser.parse(loginInfo);
	    JsonObject jsonObj = (JsonObject)obj;
	    JsonObject callbackResponse = (JsonObject) jsonObj.get("response");
	    String naverUniqueNo = callbackResponse.get("id").toString();
	    
	    
	    if (naverUniqueNo != null && !naverUniqueNo.equals("")) {
	    	System.out.println(naverUniqueNo);
	    	
	        /** 
	            TO DO : 리턴받은 naverUniqueNo 해당하는 회원정보 조회 후 로그인 처리 후 메인으로 이동
	        */
	    	return "/member/login";
	    // 네이버 정보조회 실패
	    } else {
	        throw new Exception("네이버 정보조회에 실패했습니다.");
	    }

	}
}
