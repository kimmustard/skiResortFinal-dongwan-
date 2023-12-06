package com.web.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.www.service.AdminService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/developer/*")
@RequiredArgsConstructor
public class AdminController {

	private final AdminService asv;
	
	@GetMapping("/setting")
	public String adminPageForm() {
		log.info("개발자페이지 진입");
		return "/developer/setting";
	}
	
}
