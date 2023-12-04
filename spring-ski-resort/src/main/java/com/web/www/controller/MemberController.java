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

import com.web.www.domain.member.AuthUser;
import com.web.www.domain.member.MemberPwdDTO;
import com.web.www.domain.member.MemberVO;
import com.web.www.domain.member.ModifyMemberDTO;
import com.web.www.domain.member.RegisterMemberDTO;
import com.web.www.domain.pay.PayInfoVO;
import com.web.www.service.MemberService;
import com.web.www.service.PayService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member/*")
@RequiredArgsConstructor
public class MemberController {

	private final MemberService msv;
	private final PayService psv;
	
	/**
	 * @BCryptPasswordEncoder 사용자 pwd 인코더
	 */
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
	public String detailForm(@AuthUser MemberVO mvo, Model model, PayInfoVO pivo) {
		MemberVO detailMvo = msv.getUser(mvo.getMemberId() , mvo.getMemberType());
		model.addAttribute("mvo", detailMvo);
		model.addAttribute("mDTO", new RegisterMemberDTO());
		return "/member/detail";
	}
	
	@PostMapping("/detail")
	public String detail(@Validated @ModelAttribute("mDTO") ModifyMemberDTO mDTO,
			BindingResult bindingResult, HttpServletRequest request, HttpServletResponse response,
			RedirectAttributes rttr, Model model, @AuthUser MemberVO mvo) {
		
		if(bindingResult.hasErrors()) {
			model.addAttribute("mvo", mvo);
			return "/member/detail";
		}
		
		int isMod = msv.modifyMember(mDTO);
		rttr.addFlashAttribute("isMod", isMod);
		logout(request, response);
		return "redirect:/member/login";
	}
	
	@GetMapping("/memberPwd")
	public String pwdForm(@AuthUser MemberVO mvo, Model model) {
		MemberVO detailMvo = msv.getUser(mvo.getMemberId() , mvo.getMemberType());
		model.addAttribute("mvo", detailMvo);
		model.addAttribute("mpDTO", new MemberPwdDTO());
		return "/member/memberPwd";
	}
	
	@PostMapping("/memberPwd")
	public String pwdChange(@Validated @ModelAttribute("mpDTO")MemberPwdDTO mpDTO, BindingResult bindingResult, 
			HttpServletRequest request, HttpServletResponse response, @AuthUser MemberVO mvo,
			RedirectAttributes rttr, Model model) {
		
		if(bindingResult.hasErrors()) {
			MemberVO detailMvo = msv.getUser(mvo.getMemberId() , mvo.getMemberType());
			model.addAttribute("mvo", detailMvo);
			return "/member/memberPwd";
		}
			
		if(bcEncoder.matches(mpDTO.getExPwd(), mvo.getMemberPwd())) {
			
			//회원 넘버와 인코딩된 비밀번호 저장
			mpDTO.setMemberNum(mvo.getMemberNum());
			mpDTO.setChangePwd(bcEncoder.encode(mpDTO.getChangePwd()));
			
			//변경된 비밀번호 저장
			int isMod = msv.updatePwd(mpDTO);
			
			rttr.addFlashAttribute("isMod", isMod);
			logout(request, response);
			return "redirect:/member/login";
		}else {
			int isMod = 2;
			rttr.addFlashAttribute("isMod", isMod);
			return "redirect:/member/memberPwd";
		}
		
	}
	
	
	
	
	
	// sub 로그아웃 컨트롤러
	@GetMapping("/logoutSub")
	public String logoutTab(HttpServletRequest request, HttpServletResponse response) {
		logout(request, response);
		return "redirect:/";
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
		
	
	@GetMapping("/coupon")
	public String couponGet(@AuthUser MemberVO mvo) {
		int isOk = msv.couponGet(mvo.getMemberNum());
		return "index";
	}
	
	
	
}
