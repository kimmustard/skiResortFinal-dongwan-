package com.web.www.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Setter
@Getter
@Component
public class LoginFailureHandler implements AuthenticationFailureHandler {

	private String authId;
	private String errorMessage;

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		setAuthId(request.getParameter("memberId"));
		
		/**
		 * Exception 발생 메세지 저장
		 * @BadCredentialsException 비밀번호 오류 예외클래스
		 * @InternalAuthenticationServiceException 인증시 내부 오류 예외클래스 (아이디 체크관련 X)
		 */
		if(exception instanceof BadCredentialsException || 
				exception instanceof InternalAuthenticationServiceException) {
			setErrorMessage(exception.getMessage().toString());
		}
		log.info("LoginFailureHanlder error Message = {}", errorMessage);
		request.setAttribute("memberId", getAuthId());
		request.setAttribute("errMsg", getErrorMessage());
		request.getRequestDispatcher("/member/login?error")
			.forward(request, response);
	}

}
