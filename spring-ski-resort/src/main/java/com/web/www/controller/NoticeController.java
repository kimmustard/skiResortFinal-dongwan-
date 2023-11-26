package com.web.www.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.www.domain.board.PagingVO;
import com.web.www.domain.FileVO;
import com.web.www.domain.board.NoticeDTO;
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
		log.info(" >>>>> register "+nvo+" "+files);
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
	
//	@GetMapping({"/detail","/modify"})
//	public void noticeDetail(Model m, @RequestParam("noticeNum")long noticeNum) {
//		NoticeVO nvo = nsv.noticeDetail(noticeNum);
//		m.addAttribute("nvo",nvo);
//	}
	
	//파일업로드 추가
	@GetMapping({"/detail","/modify"})
	public void noticeDetail(Model m, @RequestParam("noticeNum")long noticeNum) {
		NoticeDTO ndto = nsv.noticeDetail(noticeNum);
		m.addAttribute("ndto",ndto);
	}
	
//	@PostMapping("/modify")
//	public String noticeModify(NoticeVO nvo) {
//		int isOk = nsv.noticeModify(nvo);
//		log.info(">>>>> notice modify >> "+(isOk > 0? "OK" : "Fail"));
//		return "redirect:/notice/list";
//	}
	
	//파일업로드 추가
	@PostMapping("/modify")
	public String noticeModify(NoticeVO nvo, RedirectAttributes re,
			@RequestParam(name="files", required = false)MultipartFile[] files) {
		log.info(" >>>>> modify "+nvo+" "+files);
		
		List<FileVO> flist = null;
		if(files[0].getSize() > 0) {
			String category ="notice";
			flist = fh.uploadFiles(files,category);
		}
		NoticeDTO ndto = new NoticeDTO(nvo, flist);
		int isOk = nsv.noticeFileModify(ndto);
		log.info(">>>>> notice modify >> "+(isOk > 0? "OK" : "Fail"));
		re.addFlashAttribute("isOk",isOk);
		return "redirect:/notice/detail?noticeNum="+nvo.getNoticeNum();
	}
	
	
	@GetMapping("/remove")
	public String noticeRemove(@RequestParam("noticeNum")long noticeNum, RedirectAttributes re) {
		int isOk = nsv.noticeRemove(noticeNum);
		log.info(">>>>> notice remove >> "+(isOk > 0? "OK" : "Fail"));
		re.addFlashAttribute("isOk", isOk);
		return "redirect:/notice/list";
	}
	
	@DeleteMapping(value = "/file/{uuid}")
	public ResponseEntity<String> noticeRemoveFile(@PathVariable("uuid") String uuid){
		log.info(">>>>파일삭제확인 uuid >>"+uuid);
		int isOk = nsv.noticeRemoveFile(uuid);
		return isOk > 0 ? new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>("0", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	

}
