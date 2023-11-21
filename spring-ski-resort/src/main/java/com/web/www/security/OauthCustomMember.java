package com.web.www.security;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.web.www.domain.member.OauthMemberVO;

public class OauthCustomMember extends User{

	private static final long serialVersionUID = 1L;
	
	private OauthMemberVO omvo;
	
	public OauthCustomMember(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	
	public OauthCustomMember(OauthMemberVO omvo) {
		super(omvo.getMemberId(),omvo.getMemberPwd(),
				omvo.getAuthList()
				   .stream()
				   .map(authVO -> new SimpleGrantedAuthority(authVO.getAuth()))
				   .collect(Collectors.toList()));
		
		//로그인 실제 객체를 완성
		this.omvo = omvo;
	}
	
}
