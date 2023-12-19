package com.web.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.www.domain.bus.BusVO;
import com.web.www.domain.member.AuthUser;
import com.web.www.domain.member.MemberVO;
import com.web.www.service.BusService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/bus/*")
@RequiredArgsConstructor
public class BusController {
	
	private final BusService bsv;
	
	
	@GetMapping("/busMap")
	public String busMap() {
		return "/bus/busMap";
	}
	
	@GetMapping("/busReserve")
	public String busReserveForm(@AuthUser MemberVO mvo, Model model) {
		log.info("bus mvo = {}",mvo);
		model.addAttribute("mvo", mvo);
		return "/bus/busReserve";
	}
	
	@PostMapping("busReserve")
	public String busReservePost(BusVO bvo) {
		log.info("BusVO bvo = {}",bvo);
		int isOk = bsv.busReserve(bvo);
		log.info((isOk > 0)? "ok":"fail");
		return "index";
	}

}
