package com.web.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	
	@GetMapping("/register")
	public String noticeRegister() {
		return "/notice/register";
	}
	
	@GetMapping("/list")
	public String noticeList() {
		return "/notice/list";
	}
	
	@GetMapping("detail")
	public String noticeDetail() {
		return "/notice/detail";
	}
	
	@GetMapping("/modify")
	public String noticeModify() {
		return "/notice/modify";
	}

}
