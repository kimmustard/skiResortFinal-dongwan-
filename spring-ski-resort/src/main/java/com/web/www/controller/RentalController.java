package com.web.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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

}
