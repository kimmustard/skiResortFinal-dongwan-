package com.web.www.service;

import com.web.www.domain.member.MemberVO;

public interface MemberService {

	int insertMember(MemberVO mvo);
	
	
	
	
	
	
	
	/**
	 * 시큐리티
	 * @param UserDetail 이후 "인증된"이메일
	 * @return DB테이블 내 LastLogin 날짜 갱신
	 */
	boolean updateLastLogin(String authEmail);
	
	/**
	 * 중복 검증 메서드 service
	 * @param memberId , memberEmail
	 * @return isOk
	 */
	int checkId(String memberId);
	int checkEmail(String memberEmail);


}
