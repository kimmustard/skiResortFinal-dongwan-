package com.web.www.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.www.domain.coupon.CouponSystem;
import com.web.www.domain.member.MemberVO;
import com.web.www.repository.AdminDAO;
import com.web.www.service.AdminService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/developer/*")
@RequiredArgsConstructor
public class AdminController {

	private final AdminService asv;
	private final AdminDAO adao;
	
	@GetMapping("/settingMain")
	public String adminPageForm() {
		return "/developer/settingMain";
	}
	
	
	
	/*************************************
	 * @Developer 관리자 페이지 "멤버 관리"
	 *************************************/
	
	@GetMapping("/settingMember")
	public String memberListForm(Model model) {
		List<MemberVO> mvoList =  asv.getMemberList();
		
		for (MemberVO mvo : mvoList) {
			mvo.setAuthList(adao.selectAuths(mvo.getMemberId()));
		}
		
		model.addAttribute("mvoList", mvoList);
		return "/developer/settingMember";
	}
	
	@GetMapping("/authUp/{id}")
	public int authMemberUp(@PathVariable("id")String MemberId) {
		int isOk = asv.authUp(MemberId);
		return isOk;
	}
	
	@GetMapping("/authDown/{id}")
	public int authMemberDown(@PathVariable("id")String MemberId) {
		int isOk = asv.authDown(MemberId);
		return isOk;
	}
	
	@GetMapping("/settingCoupon")
	public String couponListForm(Model model) {
		List<CouponSystem> csList = asv.getCouponList();
		model.addAttribute("csList", csList);
		return "/developer/settingCoupon";
	}
	
	
	/*************************************
	 * @Developer 관리자 페이지 "호텔 관리"
	 *************************************/
	
	
	
	
	
	
	/*************************************
	 * @Developer 관리자 페이지 "렌탈/리프트 관리"
	 *************************************/
	
	
	
	
	
	
	/*************************************
	 * @Developer 관리자 페이지 "게시판 관리"
	 *************************************/
	
	
	
	
	
	
}
