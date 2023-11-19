package com.web.www.service;

import org.springframework.stereotype.Service;

import com.web.www.domain.member.MemberVO;
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
		
		return mdao.insertMember(mvo);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	@Override
	public int checkId(String memberId) {
		return mdao.checkId(memberId);
	}
	
	@Override
	public int checkEmail(String memberEmail) {
		return mdao.checkEmail(memberEmail);
	}


}
