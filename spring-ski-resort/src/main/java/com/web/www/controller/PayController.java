package com.web.www.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.www.domain.member.AuthUser;
import com.web.www.domain.member.MemberVO;
import com.web.www.domain.pay.PayInfoVO;
import com.web.www.service.MemberService;
import com.web.www.service.PayService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/pay/*")
@Controller
@RequiredArgsConstructor
public class PayController {
	
	private final PayService psv;
	private final MemberService msv;
	
	@GetMapping("/testForm")
	public String payForm() {
		
		return "/pay/testForm";
	}
	
	//유저 결제 상세 페이지
	@GetMapping("/memberPayList")
	public String memberPayList(@AuthUser MemberVO mvo, Model model) {
		MemberVO detailMvo = msv.getUser(mvo.getMemberId() , mvo.getMemberType());
		List<PayInfoVO> pivoList = psv.getPayInfoList(mvo.getMemberNum());
		log.info("결제정보 조회 = {}", pivoList);
		long sum = 0;
		for (PayInfoVO payInfo : pivoList) {
			if(payInfo.getPayStatus().equals("결제완료")) {
				sum += payInfo.getPayAmount();
			}
		}
		
		model.addAttribute("sum", sum);
		model.addAttribute("mvo", detailMvo);
		model.addAttribute("pivoList" , pivoList);
		return "/pay/memberPayList";
	}
	
	@PostMapping("/refund")
	public String refunt(@RequestParam String payImpUid) throws IOException {
		log.info("##영수증정보## = {}", payImpUid);
		
		int isOk = psv.payMentRefund(payImpUid);
		return "redirect:/pay/memberList";
	}
	
	
	@ResponseBody
	@PostMapping(value = "/portOne", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> portOnePay(@RequestBody PayInfoVO pivo, @AuthUser MemberVO mvo) throws IOException {
		pivo.setMemberNum(mvo.getMemberNum());
		log.info("##결제 정보##  = {}" , pivo);
		
		//결제정보 테이블 저장
		psv.registerPay(pivo);
		
		return new ResponseEntity<String>("결제 금액 오류, 결제 취소", HttpStatus.BAD_REQUEST);
	}
	
	
	
	
	
//	private final KakaoPay kakaoPay;
//	
//	@PostMapping("/order")
//	public String order() {
//		log.info("123123");
//		
//		return"redirect:"+kakaoPay.kakaoPayReady();
//	}
//	
//	@GetMapping("/kakaoPaySuccess")
//	public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
//		log.info("kakaoPaySuccess get............................................");
//		log.info("kakaoPaySuccess pg_token : " + pg_token);
//		model.addAttribute("info", kakaoPay.kakaoPayInfo(pg_token));
//		
//	}
}
