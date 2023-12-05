package com.web.www.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.web.www.domain.member.MemberCheckDTO;
import com.web.www.domain.member.MemberPwdDTO;
import com.web.www.domain.member.MemberVO;
import com.web.www.domain.member.ModifyMemberDTO;
import com.web.www.domain.pay.PayInfoVO;
import com.web.www.security.AuthVO;

public interface MemberDAO {
	/**
	 * @param insertMember 멤버 회원가입 객체 MemberVO mvo
	 * @Param insertAuthInit 가입이후 권한부여
	 * @return Low
	 */
	int insertMember(MemberVO mvo);

	int insertAuthInit(String memberId);
	
	/**
	 * @param mvo
	 * @return 일반/소셜회원별 정보수정
	 */
	int socialModifyMember(ModifyMemberDTO mvo);
	int normalModifyMember(ModifyMemberDTO mvo);
	
	/**
	 * 소셜 유저 등록과 등록전 중복확인 메서드입니다.
	 * @param mvo, memberId
	 */
	void socialRegister(MemberVO mvo);
	
	MemberVO socialSearch(String memberId);
	
	
	
	
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
	 * @param 로그인된 회원 아이디
	 * @return 로그인된 회원 검증후 DB에서 회원정보 찾아옴
	 */
	MemberVO getUser(@Param("memberId") String memberId, @Param("memberType")String memberType);
	
	/**
	 * 중복 검증 메서드 repository
	 * @param memberId, memberEmail
	 * @return
	 */
	int checkId(String memberId);

	int checkEmail(String memberEmail);

	// 광고성 동의 체크
	int cdCheck(MemberCheckDTO mcDto);

	int updatePwd(MemberPwdDTO mpDTO);

	
	/**
	 * 쿠폰 관련
	 * @return 쿠폰시스템 테이블 쿠폰갯수
	 */
	int couponCheck();




















}
