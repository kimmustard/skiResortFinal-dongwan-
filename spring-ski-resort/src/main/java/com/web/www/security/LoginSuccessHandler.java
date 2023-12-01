package com.web.www.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import com.web.www.service.MemberService;

import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginSuccessHandler implements AuthenticationSuccessHandler {

	@Setter
	@Getter
	private String authId;
	
	@Setter
	@Getter
	private String authUrl;

	//리다이렉트로 데이터를 가져가는 역할 (RedirectStrategy)
	private RedirectStrategy rdstg = new DefaultRedirectStrategy();
	
	//실제 로그인 정보, 경로 등을 저장 (세션 객체)
	private RequestCache reqCache = new HttpSessionRequestCache();
	
	//로그인 기록용
	@Autowired
	private MemberService msv;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {

		setAuthId(authentication.getName());	//인증에 성공하여 권한을 가진 아이디
		setAuthUrl("/");
		boolean isOk = msv.updateLastLogin(getAuthId());
		
		//내부에서로그인 세션이 저장됨
		HttpSession ses = request.getSession();
		log.info("LoginSuccessHandler Session = {}", ses.toString());
		
		//시큐리티에서 로그인 값이 없다면 null로 저장될 수 있음.
		if(!isOk || ses == null) {
			return;
		}else {
			/*
			 * 시큐리티에서 로그인을 시도하면 시도한 로그인에 대한 기록삭제
			 * 이전 시도한 시큐티의 인증 실패기록
			 * 인증 실패에 대한 AUTHENTICATION_EXCEPTION 기록 삭제
			 */
			ses.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
		}
		SavedRequest saveReq = reqCache.getRequest(request, response);
		rdstg.sendRedirect(request, response, (saveReq != null ? saveReq.getRedirectUrl() : getAuthUrl()));

	}
	
	

}
