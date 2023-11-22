package com.web.www.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.modelmapper.ModelMapper;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.www.domain.member.MemberVO;
import com.web.www.domain.member.RegisterMemberDTO;
import com.web.www.repository.MemberDAO;
import com.web.www.security.AuthMember;
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
	public String loginForm(Principal principal) {
		if(principal != null) {
			return "/";
		}
		return "/member/login";
	}
	
	@PostMapping("/login")
	public String login(HttpSession ses, RedirectAttributes rttr) {
		rttr.addAttribute("memberId", ses.getAttribute("memberId"));
		rttr.addAttribute("errMsg", ses.getAttribute("errMsg"));
		return "redirect:/member/login";
	}
	
	@GetMapping("/register")
	public String registerForm(Model model) {
		model.addAttribute("mvo", new RegisterMemberDTO());
		return "/member/register";
	}
	
	@PostMapping("/register")
	public String register(@Validated @ModelAttribute("mvo")RegisterMemberDTO mvoDTO, BindingResult bindingResult) {

		if(bindingResult.hasErrors()) {
			return "/member/register";
		}
		ModelMapper modelMapper = new ModelMapper();
		MemberVO mvo = modelMapper.map(mvoDTO, MemberVO.class);
		
		mvo.setMemberPwd(bcEncoder.encode(mvo.getMemberPwd()));
		int isOk = msv.insertMember(mvo);
		return "index";
	}

	@GetMapping("/detail")
	public String detailForm(Authentication auth) {
//		AuthMember mvo = (AuthMember) auth.getPrincipal();

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
