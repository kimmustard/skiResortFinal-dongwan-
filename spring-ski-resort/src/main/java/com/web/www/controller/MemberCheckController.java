package com.web.www.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.web.www.domain.coupon.CouponGetDTO;
import com.web.www.domain.coupon.CouponSystem;
import com.web.www.domain.member.AuthUser;
import com.web.www.domain.member.MemberCheckDTO;
import com.web.www.domain.member.MemberVO;
import com.web.www.domain.pay.ReceiptDTO;
import com.web.www.handler.MemberEmailHandler;
import com.web.www.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/member/check/*")
@RequiredArgsConstructor
public class MemberCheckController {

	private final MemberService msv;
	private final MemberEmailHandler mailService;
	
	@GetMapping(value = "/id/{id}", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> duplicateId(@PathVariable("id")String MemberId){
		int isOk = msv.checkId(MemberId);
		
		return isOk > 0 ? new ResponseEntity<String> ("1", HttpStatus.OK) : 
			new ResponseEntity<String> ("0", HttpStatus.NOT_FOUND);
	}
	
	@GetMapping(value = "/email/{email}", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> duplicateEmail(@PathVariable("email")String MemberEmail){
		int isOk = msv.checkEmail(MemberEmail);
		
		return isOk > 0 ? new ResponseEntity<String> ("1", HttpStatus.OK) : 
			new ResponseEntity<String> ("0", HttpStatus.NOT_FOUND);
	}
	
	@GetMapping(value = "/num/{email}", produces = MediaType.TEXT_PLAIN_VALUE)
	public String emailNumCheck(@PathVariable("email")String MemberEmail){
		return mailService.joinEmail(MemberEmail);
	}
	
	@PostMapping(value = "/cdcheck", consumes = MediaType.APPLICATION_JSON_VALUE)
	public String cdCheck(@RequestBody MemberCheckDTO mcDto) {
		int isOk = msv.cdCheck(mcDto); 
		return isOk == 1 ? "1" : "0";
	}
	
	//
	//
	// 영수증 조회하기
	@GetMapping("/receipt/{uid}")
	public ResponseEntity<ReceiptDTO> receiptGet(@PathVariable("uid") String payMerChantUid){
		ReceiptDTO rcDTO = msv.getReceipt(payMerChantUid);
		
		return rcDTO != null ? new ResponseEntity<ReceiptDTO> (rcDTO, HttpStatus.OK) 
				: new ResponseEntity<> (HttpStatus.BAD_REQUEST);
	}
	
	@GetMapping("/marchant/{uid}")
	public ResponseEntity<String> checkMarchantUid(@PathVariable("uid") String payMerChantUid){
		int isOk = msv.checkMarchantUid(payMerChantUid);
		
		return isOk > 0 ? new ResponseEntity<String> ("1", HttpStatus.OK) :
			new ResponseEntity<String> ("0", HttpStatus.BAD_REQUEST);
	}
	
	
	/************************************************
	 * 쿠폰 비동기 로직 영역
	 * @쿠폰
	 */
	//배너 클릭형 쿠폰 획득 로직
	@GetMapping("/coupon/{code}")
	public ResponseEntity<String> couponGet(@AuthUser MemberVO mvo, @PathVariable("code") String couponCode) {
		
		if(mvo == null) {
			return new ResponseEntity<String> ("2", HttpStatus.BAD_REQUEST);
		}
		
		CouponGetDTO cgDto = new CouponGetDTO();
		cgDto.setMemberNum(mvo.getMemberNum());
		cgDto.setCouponCode(couponCode);
		int isOk = msv.userCouponAdd(cgDto);
		
		return isOk > 0 ? new ResponseEntity<String> ("1", HttpStatus.OK) :
			new ResponseEntity<String> ("0", HttpStatus.NOT_FOUND);
	}
	
	@GetMapping(value = "/couponList", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<CouponGetDTO>> couponList(@AuthUser MemberVO mvo) {
		List<CouponGetDTO> cpList = msv.getUserCouponList(mvo.getMemberNum());
		
		return new ResponseEntity<List<CouponGetDTO>> (cpList, HttpStatus.OK);
	}
	
	
	
	
	//기본 쿠폰 갱신
	@PostConstruct
	public void couponCreate() {
		
		if( msv.couponCheck() == 0 ) {
			List<CouponSystem> couponSystemList = new ArrayList<>();
			
			couponSystemList.add(new CouponSystem("WelcomeUser","Y","N","N",30,"신규회원 쿠폰",0,10));
			couponSystemList.add(new CouponSystem("openWorld","Y","N","N",30,"오픈기념 쿠폰",0,10));
			couponSystemList.add(new CouponSystem("integerTest","Y","N","N",30,"정수형 테스트 쿠폰",1000,0));
			couponSystemList.add(new CouponSystem("rateTest","Y","N","N",30,"퍼센트 테스트 쿠폰",0,5));
			couponSystemList.add(new CouponSystem("ABCD-1234","Y","Y","N",7,"입력형 테스트 쿠폰",0,3));
			couponSystemList.add(new CouponSystem("adminTest","Y","N","Y",7,"관리자 분산형 쿠폰",500,0));
			
			for (CouponSystem couponSystem : couponSystemList) {
				msv.couponCreate(couponSystem);
			}
		}
	}
	
}
