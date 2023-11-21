package com.web.www.repository;

import java.util.List;

import com.web.www.domain.member.MemberVO;
import com.web.www.domain.member.OauthMemberVO;
import com.web.www.security.AuthVO;

public interface MemberDAO {
	/**
	 * @param insertMember 멤버 회원가입 객체 MemberVO mvo
	 * @Param insertAuthInit 가입이후 권한부여
	 * @return Low
	 */
	int insertMember(MemberVO mvo);

	int insertAuthInit(String memberId);
	
	//소셜 유저 가입
	void socialRegister(OauthMemberVO omvo);
	
	
	
	
	
	/**
	 * 시큐리티 UserDetail DB검증 접근 메서드입니다.
	 * @param username(MemberId 회원 아이디) 
	 * @return MemberVO mvo, 회원 권한 리스트
	 */
	
	MemberVO selectMemberId(String username);
	
	List<AuthVO> selectAuths(String username);
	
	//시큐리티 LastLogin 체크 
	int updateLastLogin(String authEmail);
	
	
	/**
	 * 중복 검증 메서드 repository
	 * @param memberId, memberEmail
	 * @return
	 */
	int checkId(String memberId);

	int checkEmail(String memberEmail);

	OauthMemberVO socialSearch(String memberId);
















}
