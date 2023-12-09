package com.web.www.service;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.www.domain.coupon.CouponGetDTO;
import com.web.www.domain.coupon.CouponSystem;
import com.web.www.domain.member.FindIdDTO;
import com.web.www.domain.member.MemberCheckDTO;
import com.web.www.domain.member.MemberPwdDTO;
import com.web.www.domain.member.MemberVO;
import com.web.www.domain.member.ModifyMemberDTO;
import com.web.www.repository.MemberDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

	private final MemberDAO mdao;

	@Transactional
	@Override
	public int insertMember(MemberVO mvo) {
		mdao.insertMember(mvo);	//가입
		return mdao.insertAuthInit(mvo.getMemberId());
	}

	@Transactional
	@Override
	public int socialRegister(MemberVO mvo) {
		mdao.socialRegister(mvo);	//소셜유저 가입
		return mdao.insertAuthInit(mvo.getMemberId());
	}
	
	@Override
	public int modifyMember(ModifyMemberDTO mvo) {
		if(mvo.getMemberType() != "normal") {
			return mdao.socialModifyMember(mvo);
		}
		return mdao.normalModifyMember(mvo);
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
	public MemberVO socialSearch(String memberId) {
		return mdao.socialSearch(memberId);
	}
	
	@Override
	public int socialLeaveSearch(String memberId) {
		return mdao.socialLeaveSearch(memberId);
	}

	// 광고체크 비동기로 받기
	@Override
	public int cdCheck(MemberCheckDTO mcDTO) {
		return mdao.cdCheck(mcDTO);
	}

	
	@Override
	public MemberVO getUser(String memberId, String memberType) {
		return mdao.getUser(memberId, memberType);
	}

	@Override
	public int updatePwd(MemberPwdDTO mpDTO) {
		return mdao.updatePwd(mpDTO);
	}

	
	
	
	
	/************************************************
	 * @쿠폰 비즈니스 로직입니다.
	 */
	// 서버실행시 관리 될 쿠폰 생성 메서드입니다.
	@Override
	public int couponCheck() {
		return mdao.couponCheck();
	}
	@Override
	public void couponCreate(CouponSystem couponSystem) {
		mdao.couponCreate(couponSystem);
		
	}
	
	// 유저에게 쿠폰을 생성합니다.
	@Transactional
	@Override
	public int userCouponAdd(CouponGetDTO cgDTO) {	
		// 유저에게 쿠폰이 있는지 없는지 확인 (중복확인)
		if(mdao.userCouponCheck(cgDTO) != 0) {
			return 0;
		}
		
		// 생성할 쿠폰에 기간을 부여합니다.
	    int day = mdao.userCouponDate(cgDTO.getCouponCode());

	    // 현재 시간을 가져옵니다.
	    LocalDateTime currentTime = LocalDateTime.now();

	    // 쿠폰의 시작일과 종료일을 설정합니다.
	    cgDTO.setCouponStart(currentTime);
	    cgDTO.setCouponEnd(currentTime.plusDays(day));

	    // 쿠폰을 추가합니다.
	    return mdao.userCouponAdd(cgDTO);
	}

	//유저 쿠폰 리스트 가져오기
	@Transactional
	@Override
	public List<CouponGetDTO> getUserCouponList(long memberNum) {
		return mdao.getUserCouponList(memberNum);
	}

	@Transactional
	@Override
	public int memberLeave(MemberVO mvo) {
		//회원탈퇴 -> 회원탈퇴 로그 테이블에 기록남기기
		
		mdao.memberLeaveLegAt(mvo);
		return mdao.memberLeave(mvo);
	}

	
	/**
	 * @findId 아이디 찾기
	 * @findPWd 패스워드 찾기
	 */
	@Override
	public String findId(FindIdDTO fiDTO) {
		return mdao.findId(fiDTO);
	}






















}
