package com.web.www.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * 메인입니다.
 */
@Controller
public class HomeController {

	@GetMapping("/")
	public String home() {
		return "index";
	}
	
}
