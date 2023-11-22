package com.web.www.security;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.web.www.domain.member.MemberVO;

import lombok.Getter;

@Getter
public class AuthMember extends User{
	
	private static final long serialVersionUID = 1L;
	
	private MemberVO mvo;
	
	public AuthMember(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	
	public AuthMember(MemberVO mvo) {
		super(mvo.getMemberId(), mvo.getMemberPwd(),
				mvo.getAuthList()
				   .stream()
				   .map(authVO -> new SimpleGrantedAuthority(authVO.getAuth()))
				   .collect(Collectors.toList()));
		
		//로그인 실제 객체를 완성
		this.mvo = mvo;
	}
	
}
