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
import org.springframework.stereotype.Component;

import com.web.www.service.MemberService;

import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class OauthSuccessHandler implements AuthenticationSuccessHandler {
	

	@Setter
	@Getter
	private String authId;
	
	@Setter
	@Getter
	private String authUrl;
	
	//로그인 기록용
	@Autowired
	private MemberService msv;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {

		setAuthId(authentication.getName());	//인증에 성공하여 권한을 가진 아이디
		setAuthUrl("/");

		boolean isOk = msv.updateLastLogin(authId);
		
		//내부에서로그인 세션이 저장됨
		HttpSession ses = request.getSession();
		log.info("LoginSuccessHandler Session = {}", ses.toString());
		
		//로그인시 추가정보 (객체에서 필요한 정보가 있다면 직접 추가해주세요.)
		AuthMember authMember = (AuthMember) authentication.getPrincipal();
		ses.setAttribute("memberId", authMember.getMvo().getMemberId());
		ses.setAttribute("memberEmail", authMember.getMvo().getMemberEmail());
		ses.setAttribute("memberAlias", authMember.getMvo().getMemberAlias());
		ses.setAttribute("memberName", authMember.getMvo().getMemberName());
		ses.setAttribute("memberPhoneNum", authMember.getMvo().getMemberPhoneNum());
		ses.setAttribute("memberType", authMember.getMvo().getMemberType());
		
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
	}

}
