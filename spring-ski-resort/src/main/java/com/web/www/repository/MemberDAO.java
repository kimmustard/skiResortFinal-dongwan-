package com.web.www.repository;

import java.util.List;

import com.web.www.domain.member.MemberVO;
import com.web.www.security.AuthVO;

public interface MemberDAO {
	/**
	 * @param 멤버 회원가입 객체 MemberVO mvo
	 * @return Low
	 */
	int insertMember(MemberVO mvo);

	
	
	
	
	
	
	/**
	 * 시큐리티 UserDetail DB검증 접근 메서드입니다.
	 * @param username(MemberId 회원 아이디) 
	 * @return MemberVO mvo, 회원 권한 리스트
	 */
	
	MemberVO selectMemberId(String username);
	
	List<AuthVO> selectAuths(String username);
	
	/**
	 * 중복 검증 메서드 repository
	 * @param memberId, memberEmail
	 * @return
	 */
	int checkId(String memberId);

	int checkEmail(String memberEmail);

}
