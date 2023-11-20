package com.web.www.repository;

import com.web.www.domain.member.MemberVO;

public interface MemberDAO {

	int insertMember(MemberVO mvo);

	
	
	
	
	
	
	
	
	
	/**
	 * 중복 검증 메서드 repository
	 * @param memberId, memberEmail
	 * @return
	 */
	int checkId(String memberId);

	int checkEmail(String memberEmail);

}
