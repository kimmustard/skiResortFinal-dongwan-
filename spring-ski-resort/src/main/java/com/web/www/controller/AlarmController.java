package com.web.www.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.www.domain.alarm.AlarmContentVO;
import com.web.www.domain.coupon.CouponGetDTO;
import com.web.www.domain.member.AuthUser;
import com.web.www.domain.member.MemberVO;
import com.web.www.service.AlarmService;
import com.web.www.service.MemberService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/alarm/*")
@RequiredArgsConstructor
public class AlarmController {

	private final AlarmService asv;
	private final MemberService msv;
	
	@GetMapping("/welcomMember")
	public String alarmCheckAndCouponGet(@AuthUser MemberVO mvo, RedirectAttributes rttr){
		CouponGetDTO cgDTO = new CouponGetDTO();
		cgDTO.setMemberNum(mvo.getMemberNum());
		cgDTO.setCouponCode("WelcomeUser");
		
		int isOk = msv.userCouponAdd(cgDTO);
		rttr.addFlashAttribute("isOk", isOk);
		return "redirect:/";
	}
	
	
	
	@PostConstruct
	public void addAlarmList() {
		int alarmCnt = asv.selectAlarmCnt();
		if(alarmCnt == 0) {
			List<AlarmContentVO> alarmContentList = new ArrayList<>();
			alarmContentList.add(new AlarmContentVO(1,"관리자","신규회원 가입기념 쿠폰지급","/member/welcomeMember"));
			alarmContentList.add(new AlarmContentVO(2,"시스템","임시비밀번호 발급을 하셨습니다. 비밀번호를 변경해주세요","/member/memberPwd"));
		
			for (int i = 0; i < alarmContentList.size(); i++) {
				asv.addAlarmList(alarmContentList.get(i));
				
			}
		
		}
	}
}
