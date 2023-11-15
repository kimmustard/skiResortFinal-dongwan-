package com.web.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.www.domain.MemberVO;
import com.web.www.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {

	
	private final MemberService msv;
	
	
	/**
	 * @로그인
	 */
	@GetMapping("/login")
	public String loginForm() {
		
		return "/member/login";
	}
	
	@PostMapping("/login")
	public String login() {
		
		return "/";
	}
	
	
	/**
	 * @가입
	 */	
	@GetMapping("/register")
	public String registerForm() {
		
		return "/member/register";
	}
	
	@PostMapping("/register")
	public String register(@ModelAttribute("mvo")MemberVO mvo) {
		
		return "/member/register";
	}
	
	
	/**
	 * @회원관리
	 */
	@GetMapping("/detail")
	public String detailForm(@ModelAttribute("mvo")MemberVO mvo, Model model) {
		
		
		return "/member/detail";
	}
	
	
	
		
}
