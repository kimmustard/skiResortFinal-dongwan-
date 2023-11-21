package com.web.www.service;

import org.springframework.stereotype.Service;

import com.web.www.domain.member.MemberVO;
import com.web.www.domain.member.OauthMemberVO;
import com.web.www.repository.MemberDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

	private final MemberDAO mdao;

	@Override
	public int insertMember(MemberVO mvo) {
		mdao.insertMember(mvo);	//가입
		return mdao.insertAuthInit(mvo.getMemberId());
	}

	@Override
	public int socialRegister(OauthMemberVO omvo) {
		mdao.socialRegister(omvo);	//소셜유저 가입
		return mdao.insertAuthInit(omvo.getMemberId());
	}
	
	
	
	
	
	/**
	 * 시큐리티 LastLogin 체크
	 */
	
	@Override
	public boolean updateLastLogin(String authEmail) {
		return mdao.updateLastLogin(authEmail) > 0 ? true : false;
	}
	
	
	/**
	 * @회원가입 Id / Email 중복체크입니다.
	 */
	@Override
	public int checkId(String memberId) {
		return mdao.checkId(memberId);
	}
	
	@Override
	public int checkEmail(String memberEmail) {
		return mdao.checkEmail(memberEmail);
	}


	/**
	 * 시큐리티 OAuth인증
	 */

	@Override
	public OauthMemberVO socialSearch(String memberId) {
		return mdao.socialSearch(memberId);
	}
















}
