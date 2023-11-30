package com.web.www.controller;

import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.www.domain.pay.UserPayInfoDTO;
import com.web.www.service.PayService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/pay/*")
@RequiredArgsConstructor
public class PayController {
	
	private final PayService ps;
	
	@GetMapping("/testForm")
	public String payForm() {
		
		return "/pay/testForm";
	}
	
	@ResponseBody
	@PostMapping(value = "/portOne", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public String protOnePay(@RequestBody UserPayInfoDTO upiDTO, HttpSession ses) {
		long memberNum = (long) ses.getAttribute("memberNum");
		upiDTO.setMemberNum(memberNum);
		log.info("##결제 정보##  = {}" , upiDTO);
		
		//결제정보 테이블 저장
		ps.registerPay(upiDTO);
		
		
		return null;
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
