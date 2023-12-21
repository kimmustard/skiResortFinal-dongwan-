package com.web.www.service;

import java.time.LocalDateTime;
import java.util.List;

import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.www.domain.alarm.AlarmVO;
import com.web.www.domain.coupon.CouponGetDTO;
import com.web.www.domain.coupon.CouponSystem;
import com.web.www.domain.member.FindIdDTO;
import com.web.www.domain.member.FindPwdDTO;
import com.web.www.domain.member.MemberCheckDTO;
import com.web.www.domain.member.MemberPwdDTO;
import com.web.www.domain.member.MemberVO;
import com.web.www.domain.member.ModifyMemberDTO;
import com.web.www.domain.pay.ReceiptDTO;
import com.web.www.repository.AlarmDAO;
import com.web.www.repository.MemberDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

	private final MemberDAO mdao;
	private final AlarmDAO adao;

	@Transactional
	@Override
	public int insertMember(MemberVO mvo) {
		mdao.insertMember(mvo);	//가입
		int isOk = mdao.insertAuthInit(mvo.getMemberId());
		
		//알람 발송
		long memberNum = mdao.recentMember();
		adao.alarmSetting(new AlarmVO(memberNum , 1, "쿠폰"));
		return isOk;
	}

	@Transactional
	@Override
	public int socialRegister(MemberVO mvo) {
		mdao.socialRegister(mvo);	//소셜유저 가입
		int isOk = mdao.insertAuthInit(mvo.getMemberId());
		//알람 발송
		long memberNum = mdao.recentMember();
		adao.alarmSetting(new AlarmVO(memberNum , 1, "쿠폰"));
		return isOk;
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
	    cgDTO.setCouponEnd(currentTime.plusDays(day).toLocalDate().atTime(0, 0, 0));

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

	@Override
	public int findPwd(FindPwdDTO fpDTO) {
		return mdao.findPwd(fpDTO);
	}

	@Override
	public void findPwdUpdate(FindPwdDTO fpDTO) {
		mdao.findPwdUpdate(fpDTO);
		long memberNum = adao.getAlarmMemberNum(fpDTO.getMemberId());
		adao.alarmSetting(new AlarmVO(memberNum , 5, "변경"));
	}

	
	//멤버 알람 시스템 온오프 비동기작업 (DB에 Y / N 부여작업)
	@Override
	public int masCheck(MemberCheckDTO mcDto) {
		
		return adao.masCheck(mcDto);
	}

	
	/*멤버 알람체크 on /off 가져오기 **/
	@Override
	public String getMemberMasCheck(long memberNum) {
		
		return mdao.getMemberMasCheck(memberNum);
	}
	
	/**
	 * @getMemberGrade 결제전 멤버 등급 조회
	 */
	@Override
	public String getMemberGrade(long memberNum) {
		return mdao.getMemberGrade(memberNum);
	}

	@Transactional
	@Override
	public ReceiptDTO getReceipt(String payMerChantUid) {
	    ReceiptDTO originalReceipt = mdao.getReceipt(payMerChantUid);
	    ModelMapper modelMapper = new ModelMapper();
	    modelMapper.getConfiguration().setSkipNullEnabled(true);

	    if (originalReceipt.getPayStatus().equals("결제취소")) {
	        ReceiptDTO refundReceipt = mdao.getRefundReceipt(payMerChantUid);

	        // originalReceipt에서 refundReceipt로 매핑
	        modelMapper.map(originalReceipt, refundReceipt);
	        log.info("환불 = {}", refundReceipt);

	        return refundReceipt;
	    }
	    switch (originalReceipt.getPayNameType()) {
	        case "호텔":
	            ReceiptDTO hotelReceipt = mdao.getHotelReceipt(payMerChantUid);
	           
	            // 필드 설정
	            modelMapper.map(originalReceipt, hotelReceipt);
	            
	            return hotelReceipt;
	        case "리프트":
	        	//문제위치
	            ReceiptDTO liftReceipt = mdao.getLiftReceipt(payMerChantUid);
	            
	            // 필드 설정
	            modelMapper.map(originalReceipt, liftReceipt);
	            return liftReceipt;
	        case "렌탈":
	            ReceiptDTO rentalReceipt = mdao.getRentalReceipt(payMerChantUid);
	            //장비종류 가져오기
	            
	            
	            // 필드 설정
	            modelMapper.map(originalReceipt, rentalReceipt);
	            return rentalReceipt;
	        default:
	            	
	            return null;
	    }

	}

	//문의사항 유저 주문번호 체크하기
	@Override
	public int checkMarchantUid(String payMerChantUid) {
		return mdao.checkMarchantUid(payMerChantUid);
	}




}
