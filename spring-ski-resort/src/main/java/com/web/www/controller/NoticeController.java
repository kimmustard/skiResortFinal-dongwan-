package com.web.www.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.www.domain.board.NoticeVO;
import com.web.www.service.NoticeService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/notice/*")
@RequiredArgsConstructor
public class NoticeController {
	
	private final NoticeService nsv;
	
	
	
	@GetMapping("/register")
	public String noticeRegister() {
		return "/notice/register";
	}
	
	@PostMapping("/register")
	public String noticeRegister(NoticeVO nvo, Model m) {
		int isOk = nsv.noticeRegister(nvo);
		log.info(">>>>> notice register >> "+(isOk > 0? "OK" : "Fail"));
		return "redirect:/notice/list";
	}
	
	
//	@GetMapping("/list")
//	public String noticeList(Model m) {
//		List<NoticeVO> list = nsv.noticeList();
//		m.addAttribute("list", list);
//		return "/notice/list";
//	}
	
	@GetMapping("/list")
	public void noticeList(Model m) {
		List<NoticeVO> list = nsv.noticeList();
		m.addAttribute("list", list);
		
	}
	
	@GetMapping("/detail")
	public void noticeDetail(Model m, @RequestParam("noticeNum")long noticeNum) {
		NoticeVO nvo = nsv.noticeDetail(noticeNum);
		m.addAttribute("nvo",nvo);
	}
	
	@GetMapping("/modify")
	public String noticeModify() {
		return "/notice/modify";
	}

}
