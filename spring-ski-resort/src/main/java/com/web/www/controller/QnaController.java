package com.web.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/qna/*")
@RequiredArgsConstructor
public class QnaController {
	
	
	
	@GetMapping("/register")
	public String qnaRegister() {
		return "/qna/register";
	}
	
	
	@GetMapping("/list")
	public String qnaList(Model m) {
		return "/qna/list";
	}
	
	
	

}
