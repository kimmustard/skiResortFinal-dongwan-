package com.web.www.service;

import java.util.List;

import com.web.www.domain.member.MemberCheckDTO;
import com.web.www.domain.member.MemberPwdDTO;
import com.web.www.domain.member.MemberVO;
import com.web.www.domain.member.ModifyMemberDTO;
import com.web.www.domain.pay.PayInfoVO;

public interface MemberService {

	int insertMember(MemberVO mvo);
	
	//소셜 유저 로그인
	int socialRegister(MemberVO omvo);
	
	int modifyMember(ModifyMemberDTO mvo);
	
	/**
	 * 유저 디테일 페이지 관련
	 * getUser
	 * @param memberId memberType 사용자 정보 가져올때 사용합니다.
	 * @return 유저정보
	 */
	MemberVO getUser(String memberId, String memberType);
	
	
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
	
	/**
	 * 시큐리티 Oauth2.0 인증
	 * @param 소셜 memberId DB에 없으면 유저를 등록해준다. 권한까지 부여함
	 * @return OauthMemberVO omvo
	 */
	MemberVO socialSearch(String memberId);

	// 광고 체크 비동기로 받기
	int cdCheck(MemberCheckDTO mcDto);

	int updatePwd(MemberPwdDTO mpDTO);

	
	/**
	 *	@coupon 쿠폰관련 service 메서드 입니다.
	 * */
	int couponGet(long memberNum);












}
