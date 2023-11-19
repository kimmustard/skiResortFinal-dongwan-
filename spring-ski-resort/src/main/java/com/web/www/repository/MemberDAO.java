package com.web.www.repository;

import com.web.www.domain.member.MemberVO;

public interface MemberDAO {

	int insertMember(MemberVO mvo);

	
	
	
	
	
	
	
	
	
	/**
	 * 검증 메서드 repository
	 * @param memberId
	 * @return
	 */
	int checkId(String memberId);

}
