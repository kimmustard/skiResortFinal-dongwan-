package com.web.www.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.www.domain.alarm.AlarmContentVO;
import com.web.www.domain.alarm.AlarmDTO;
import com.web.www.domain.alarm.AlarmReadDTO;
import com.web.www.domain.coupon.CouponGetDTO;
import com.web.www.domain.member.AuthUser;
import com.web.www.domain.member.MemberCheckDTO;
import com.web.www.domain.member.MemberVO;
import com.web.www.service.AlarmService;
import com.web.www.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/alarm/*")
@RequiredArgsConstructor
public class AlarmController {

	private final AlarmService asv;
	private final MemberService msv;
	
	//가입이후 쿠폰지급
	@GetMapping("/welcomeMember")
	public String alarmCheckAndCouponGet(@AuthUser MemberVO mvo, RedirectAttributes rttr){
		CouponGetDTO cgDTO = new CouponGetDTO();
		cgDTO.setMemberNum(mvo.getMemberNum());
		cgDTO.setCouponCode("WelcomeUser");
		
		int isOk = msv.userCouponAdd(cgDTO);
		if(isOk == 0) {
			rttr.addFlashAttribute("isOk", 2);
			return "redirect:/";
		}
		
		rttr.addFlashAttribute("isOk", isOk);
		return "redirect:/";
	}
	
	//클릭형 쿠폰 지급
	@GetMapping("/clickEvent")
	public String clickAndCouponGet(@RequestParam("code")String code, @AuthUser MemberVO mvo, RedirectAttributes rttr){
		CouponGetDTO cgDTO = new CouponGetDTO();
		cgDTO.setMemberNum(mvo.getMemberNum());
		cgDTO.setCouponCode(code);
		
		int isOk = msv.userCouponAdd(cgDTO);
		if(isOk == 0) {
			rttr.addFlashAttribute("isOk", 2);
			return "redirect:/";
		}
		
		rttr.addFlashAttribute("isOk", isOk);
		return "redirect:/";
	}
	
	//nav에 표현되는 간이 리스트입니다 (최신 10개만 표시)
	@GetMapping(value = "/alarmList", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<AlarmDTO>> alarmListTen(@AuthUser MemberVO mvo) {
		if(mvo == null) {
			return ResponseEntity.noContent().build();
		}
		
		
		String alarmCheck = msv.getMemberMasCheck(mvo.getMemberNum());
		log.info("테스트 = {}", alarmCheck);
		if(alarmCheck.equals("N")) {
			return ResponseEntity.noContent().build();
		}
		
		
		List<AlarmDTO> alarmList = asv.getAlarmListTen(mvo.getMemberNum());
		log.info("테스트 = {}", alarmList);
		
		return new ResponseEntity<List<AlarmDTO>> (alarmList, HttpStatus.OK);
	}
	
	@PostMapping(value = "/alarmReadCheck", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> alarmReadCheck(@RequestBody AlarmReadDTO arDTO){
		int isOk = asv.alarmReadCheck(arDTO);
		
		return isOk > 0 ? new ResponseEntity<String> ("1",HttpStatus.OK) :
			new ResponseEntity<String> ("0",HttpStatus.NOT_FOUND) ;
		
	}
	
	@GetMapping("/memberAlarmList")
	public String memberAlarmListForm(@AuthUser MemberVO mvo, Model model) {
		List<AlarmDTO> alarmList = asv.getMemberAlarmList(mvo.getMemberNum());
		mvo.setMemberAlarmSystem(msv.getMemberMasCheck(mvo.getMemberNum()));
		model.addAttribute("mvo", mvo);
		model.addAttribute("alarmList", alarmList);
		return "/member/memberAlarmList";
	}
	
	@GetMapping("/alarmRemove")
	public String alarmRemove(@AuthUser MemberVO mvo, @RequestParam("alarmRegAt")String alarmRegAt) {
		
		asv.removeMemberAlarm(mvo.getMemberNum(), alarmRegAt);
		
		return "redirect:/alarm/memberAlarmList";
	}
	
	//비동기작업 멤버 알람 시스템 기능 on/off
	@ResponseStatus(code = HttpStatus.OK)
	@ResponseBody
	@PostMapping(value = "/systemOnOff", consumes = MediaType.APPLICATION_JSON_VALUE)
	public String cdCheck(@RequestBody MemberCheckDTO mcDto) {
		log.info("광고 체크 = {}" , mcDto);
		int isOk = msv.masCheck(mcDto); 
		return isOk > 0 ? "1" : "0";
	}
	
	
	
	
	
	

	@PostConstruct
	public void addAlarmList() {
		int alarmCnt = asv.selectAlarmCnt();
		if(alarmCnt == 0) {
			List<AlarmContentVO> alarmContentList = new ArrayList<>();
			alarmContentList.add(new AlarmContentVO(1,"관리자","신규회원 가입기념 쿠폰지급","/alarm/welcomeMember"));
			alarmContentList.add(new AlarmContentVO(2,"시스템","결제가 완료되었습니다.","/pay/memberPayList"));
			alarmContentList.add(new AlarmContentVO(3,"시스템","환불 완료되었습니다.","/pay/memberPayList"));
			alarmContentList.add(new AlarmContentVO(4,"시스템","결제가 취소되었습니다.","/pay/memberPayList"));
			alarmContentList.add(new AlarmContentVO(5,"시스템","임시비밀번호를 발급하셨습니다. 비밀번호를 변경해주세요","/member/memberPwd"));
			alarmContentList.add(new AlarmContentVO(6,"시스템","회원님 등급이 변경되었습니다.","/member/detail"));
			alarmContentList.add(new AlarmContentVO(7,"관리자","등록하신 문의글 답변이 등록되었습니다.","/member/memberQna"));
			alarmContentList.add(new AlarmContentVO(8,"시스템","버스 예약이 완료되었습니다.","/member/memberQna"));
			alarmContentList.add(new AlarmContentVO(9,"시스템","버스 예약이 취소되었습니다.","/member/memberQna"));
		
			for (int i = 0; i < alarmContentList.size(); i++) {
				asv.addAlarmList(alarmContentList.get(i));
				
			}
		
		}
	}
}
