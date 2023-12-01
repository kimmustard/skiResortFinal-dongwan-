package com.web.www.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.www.domain.member.MemberVO;
import com.web.www.domain.rental.RentalLiftVO;
import com.web.www.domain.rental.RentalVO;
import com.web.www.service.RentalService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/rental/*")
@RequiredArgsConstructor
public class RentalController {
	
	private final RentalService rsv;

	@GetMapping("/fee-info")
	public String rentalForm() {
		
		return "/rental/fee-info"; 
	}
	
	@GetMapping("/reserve")
	public String reserveForm(@ModelAttribute("mvo")MemberVO mvo) {
		log.info("MemberController mvo = {}" , mvo);
		return "/rental/reserve";
	}
	
	@PostMapping("/reserve")
	public String liftReservePost(@ModelAttribute("rlivo") RentalLiftVO rlivo, HttpSession ses) {
		log.info("rlivo = {}",rlivo);
		String memberEmail = (String)ses.getAttribute("memberEmail");
		String memberType = (String)ses.getAttribute("memberType");
		log.info("memberEmail = {}",memberEmail);
		log.info("memberType = {}",memberType);
		RentalVO rvo = new RentalVO();
		rvo.setRentalLiftNum(rlivo.getRentalLiftNum());
		rvo.setMemberEmail(memberEmail);
		rvo.setMemberType(memberType);
		int isOk = rsv.liftReserve(rlivo);
		isOk = rsv.rental(rvo);
		log.info((isOk > 0)? "ok":"fail");
		return "index";
	}
	
	
	@GetMapping("/item")
	public String itemForm() {
		return "/rental/item";
	}

}