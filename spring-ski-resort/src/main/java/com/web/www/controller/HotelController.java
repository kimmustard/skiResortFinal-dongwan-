package com.web.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.www.service.HotelService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/hotel/*")
@RequiredArgsConstructor
public class HotelController {

	
	private final HotelService hsv;
	
	
	/*
	 * 예약페이지 매핑
	 */
	@GetMapping("/reservation")
	public String reservForm() {
		log.info("reserv Check!");
		
		return "/hotel/reservation";
	}
	
	
}
