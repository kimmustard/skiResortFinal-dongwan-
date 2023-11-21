package com.web.www.controller;


import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.web.www.domain.member.MemberVO;
import com.web.www.oauth.NaverLoginBO;
import com.web.www.repository.MemberDAO;
import com.web.www.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member/*")
@RequiredArgsConstructor
public class MemberController {

	private final MemberService msv;
	
	/**
	 * @MemberDAO 시큐리티 DB선행 접근시 필요
	 * @BCryptPasswordEncoder 사용자 pwd 인코더
	 */
	private final MemberDAO mdao;
	private final BCryptPasswordEncoder bcEncoder;
	
	@GetMapping("/login")
	public String loginForm(Model model, HttpSession session) {
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		model.addAttribute("url", naverAuthUrl);
		return "/member/login";
	}
	
	@PostMapping("/login")
	public String login(HttpServletRequest request, RedirectAttributes rttr) {
		rttr.addAttribute("memberId", request.getAttribute("memberId"));
		rttr.addAttribute("errMsg", request.getAttribute("errMsg"));
		return "redirect:/member/login";
	}
	
	@GetMapping("/register")
	public String registerForm(Model model) {
		model.addAttribute("mvo", new MemberVO());
		return "/member/register";
	}
	
	@PostMapping("/register")
	public String register(@Validated @ModelAttribute("mvo")MemberVO mvo, BindingResult bindingResult) {

		if(bindingResult.hasErrors()) {
			return "/member/register";
		}
		
		mvo.setMemberPwd(bcEncoder.encode(mvo.getMemberPwd()));
		int isOk = msv.insertMember(mvo);
		log.info("register check mvo@@@@ = {}" , mvo);
		return "index";
	}

	@GetMapping("/detail")
	public String detailForm(@ModelAttribute("mvo")MemberVO mvo, Model model) {
		
		return "/member/detail";
	}
	
	
	
	
	/**
	 * @param request (회원정보)
	 * @param response (응답정보)
	 * 시큐리티 로그아웃 사용시 필요 객체
	 */
	private void logout(HttpServletRequest request, HttpServletResponse response) {
		//사용자 정보를 찾는 인자
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		new SecurityContextLogoutHandler().logout(request, response, auth);
	}
		
	
	
}
