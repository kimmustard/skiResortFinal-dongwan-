package com.web.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/bus/*")
@RequiredArgsConstructor
public class BusController {
	
	
	@GetMapping("/busMap")
	public String busMap() {
		return "/bus/busMap";
	}

}
