package com.web.www.pay;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/pay/*")
@Controller
@RequiredArgsConstructor
public class PayController {

	private final KakaoPay kakaoPay;

	@GetMapping("/testForm")
	public String payForm() {
		
		return "/pay/testForm";
	}
	@PostMapping("/order")
	public String order() {
		log.info("123123");
		
		return"redirect:"+kakaoPay.kakaoPayReady();
	}
	
	@GetMapping("/kakaoPaySuccess")
	public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
		log.info("kakaoPaySuccess get............................................");
		log.info("kakaoPaySuccess pg_token : " + pg_token);
		model.addAttribute("info", kakaoPay.kakaoPayInfo(pg_token));
		
	}
	
	
}
