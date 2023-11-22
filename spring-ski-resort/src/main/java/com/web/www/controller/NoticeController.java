package com.web.www.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.www.domain.board.PagingVO;
import com.web.www.domain.board.NoticeDTO;
import com.web.www.domain.board.FileVO;
import com.web.www.domain.board.NoticeVO;
import com.web.www.handler.FileHandler;
import com.web.www.handler.PagingHandler;
import com.web.www.service.NoticeService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/notice/*")
@RequiredArgsConstructor
public class NoticeController {
	
	private final NoticeService nsv;
	
	private final FileHandler fh;
	
	
	@GetMapping("/register")
	public String noticeRegister() {
		return "/notice/register";
	}
	
//	@PostMapping("/register")
//	public String noticeRegister(NoticeVO nvo, Model m) {
//		int isOk = nsv.noticeRegister(nvo);
//		log.info(">>>>> notice register >> "+(isOk > 0? "OK" : "Fail"));
//		return "redirect:/notice/list";
//	}
	
	//파일업로드 추가
	@PostMapping("/register")
	public String noticeRegister(NoticeVO nvo, RedirectAttributes re,
			@RequestParam(name="files", required = false)MultipartFile[] files) {
		List<FileVO> flist = null;
		if(files[0].getSize() > 0) {
			String category ="notice";
			flist = fh.uploadFiles(files,category);
		}
		int isOk = nsv.noticeRegister(new NoticeDTO(nvo, flist));
		log.info(">>>>> notice register >> "+(isOk > 0? "OK" : "Fail"));
		return "redirect:/notice/list";
	}
	
	
//	@GetMapping("/list")
//	public String noticeList(Model m) {
//		List<NoticeVO> list = nsv.noticeList();
//		m.addAttribute("list", list);
//		return "/notice/list";
//	}
	
//	@GetMapping("/list")
//	public void noticeList(Model m) {
//		List<NoticeVO> list = nsv.noticeList();
//		m.addAttribute("list", list);	
//	}
	
	//페이징 추가
	@GetMapping("/list")
	public void noticeList(Model m, PagingVO npvo) {
		m.addAttribute("list", nsv.noticeList(npvo));
		int totalCount = nsv.getTotalCount(npvo);
		PagingHandler ph = new PagingHandler(npvo, totalCount);
		m.addAttribute("ph",ph);
	}
	
	@GetMapping({"/detail","/modify"})
	public void noticeDetail(Model m, @RequestParam("noticeNum")long noticeNum) {
		NoticeVO nvo = nsv.noticeDetail(noticeNum);
		m.addAttribute("nvo",nvo);
	}
	
	@PostMapping("/modify")
	public String noticeModify(NoticeVO nvo) {
		int isOk = nsv.noticeModify(nvo);
		log.info(">>>>> notice modify >> "+(isOk > 0? "OK" : "Fail"));
		return "redirect:/notice/list";
	}
	
	@GetMapping("/remove")
	public String remove(@RequestParam("noticeNum")long noticeNum, RedirectAttributes re) {
		int isOk = nsv.remove(noticeNum);
		log.info(">>>>> notice remove >> "+(isOk > 0? "OK" : "Fail"));
		re.addFlashAttribute("isOk", isOk);
		return "redirect:/notice/list";
	}

}
