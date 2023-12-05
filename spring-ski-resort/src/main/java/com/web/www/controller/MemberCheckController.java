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

import com.web.www.domain.coupon.CouponSystem;
import com.web.www.domain.member.AuthUser;
import com.web.www.domain.member.MemberCheckDTO;
import com.web.www.domain.member.MemberVO;
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
		log.info("emailNumCheck = {}" , MemberEmail);
		return mailService.joinEmail(MemberEmail);
	}
	
	@PostMapping(value = "/cdcheck", consumes = MediaType.APPLICATION_JSON_VALUE)
	public String cdCheck(@RequestBody MemberCheckDTO mcDto) {
		log.info("광고 체크 = {}" , mcDto);
		int isOk = msv.cdCheck(mcDto); 
		return isOk == 1 ? "1" : "0";
	}
	
	
	/************************************************
	 * @쿠폰
	 */
	@GetMapping("/coupon")
	public String couponGet(@AuthUser MemberVO mvo) {
		int isOk = msv.couponGet(mvo.getMemberNum());
		return "index";
	}
	

	@PostConstruct
	public void couponCreate() {
		int couponCnt = msv.couponCheck();
		if( couponCnt == 0 ) {
			List<CouponSystem> couponSystemList = new ArrayList<>();
			
			couponSystemList.add(new CouponSystem(30,"신규회원 쿠폰","rate",0,10));
			couponSystemList.add(new CouponSystem(30,"정수형 테스트 쿠폰","integer",1000,0));
			couponSystemList.add(new CouponSystem(60,"60일 테스트 쿠폰","rate",0,5));
			
			for (CouponSystem couponSystem : couponSystemList) {
				msv.couponCreate(couponSystem);
			}
		}
	}
	
}
