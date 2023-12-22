package com.web.www.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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

import com.web.www.domain.FileVO;
import com.web.www.domain.board.PagingVO;
import com.web.www.domain.board.QnaAnsDTO;
import com.web.www.domain.board.QnaAnsVO;
import com.web.www.domain.board.QnaDTO;
import com.web.www.domain.board.QnaVO;
import com.web.www.domain.member.AuthUser;
import com.web.www.domain.member.MemberVO;
import com.web.www.handler.FileHandler;
import com.web.www.handler.PagingHandler;
import com.web.www.service.QnaService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/qna/*")
@RequiredArgsConstructor
public class QnaController {
	
	private final QnaService qsv;
	private final FileHandler fh;
	
	

///// Q&A 등록 구간 //////	
	
	@GetMapping("/register")
	public String qnaRegister() {
		return "/qna/register";
	}
	
	
	//파일업로드 추가
	@PostMapping("/register")
	public String qnaRegister(QnaVO qvo, RedirectAttributes re,
			@RequestParam(name="files", required = false)MultipartFile[] files) {
		log.info(" >>>>> qna register "+qvo+" "+files);
		List<FileVO> flist = null;
		if(files[0].getSize() > 0) {
			String category ="qna";
			flist = fh.uploadFiles(files,category);
		}
		int isOk = qsv.qnaRegister(new QnaDTO(qvo, flist));
		log.info(">>>>> qna register >> "+(isOk > 0? "OK" : "Fail"));
		if(isOk==2) {
			re.addFlashAttribute("isOk", isOk);
			return "redirect:/qna/register";
		}else {
			re.addFlashAttribute("isOk", isOk);
			return "redirect:/qna/list";
			}
		}
	

	
	
	
	@GetMapping("/list")
	public void qnaList(HttpSession ses, Model m, PagingVO pgvo) {
		String str = (String) ses.getAttribute("memberId");	
		log.info("###### = {}", str);
		m.addAttribute("list", qsv.qnaList(pgvo));
		int totalCount = qsv.getTotalCount(pgvo);
		PagingHandler ph = new PagingHandler(pgvo, totalCount);
		m.addAttribute("ph",ph);
	}
	

	
	//파일업로드 추가
	@GetMapping({"/detail","/modify","/ans-register","/ans-modify"})
	public void qnaDetail(Model m, @RequestParam("qnaNum")long qnaNum) {
		QnaDTO qdto = qsv.qnaDetail(qnaNum);
		QnaAnsDTO qadto = qsv.qnaAnsDetail(qnaNum);
		m.addAttribute("qdto",qdto);
		m.addAttribute("qadto",qadto);
	}
	
	
	
	//파일업로드 추가
		@PostMapping("/modify")
		public String qnaModify(QnaVO qvo, RedirectAttributes re,
				@RequestParam(name="files", required = false)MultipartFile[] files) {
			log.info(" >>>>>qna modify "+qvo+" "+files);
			
			List<FileVO> flist = null;
			if(files[0].getSize() > 0) {
				String category ="qna";
				flist = fh.uploadFiles(files,category);
			}
			QnaDTO qdto = new QnaDTO(qvo, flist);
			int isOk = qsv.qnaFileModify(qdto);
			log.info(">>>>> qna modify >> "+(isOk > 0? "OK" : "Fail"));
			if(isOk==2) {
				re.addFlashAttribute("isOk", isOk);
				return "redirect:/qna/modify?qnaNum="+qvo.getQnaNum();
			}else {			
				re.addFlashAttribute("isOk",isOk);
				return "redirect:/qna/detail?qnaNum="+qvo.getQnaNum();
				}
		}
		
		
		
		@GetMapping("/remove")
		public String qnaRemove(@RequestParam("qnaNum")long qnaNum, RedirectAttributes re) {
			int isOk = qsv.qnaRemove(qnaNum);
			log.info(">>>>> qna remove >> "+(isOk > 0? "OK" : "Fail"));
			re.addFlashAttribute("isOk", isOk);
			return "redirect:/qna/list";
		}
		
		
		
		@DeleteMapping(value = "/file/{uuid}")
		public ResponseEntity<String> qnaRemoveFile(@PathVariable("uuid") String uuid){
			log.info(">>>>qna file uuid >>"+uuid);
			int isOk = qsv.qnaRemoveFile(uuid);
			return isOk > 0 ? new ResponseEntity<String>("1", HttpStatus.OK)
					: new ResponseEntity<String>("0", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		
		
		
		
		
		//////////////////// Q&A 답변 등록 구간 ////////////////////////
		
		@PostMapping("/ans-register")
		public String qnaAnsRegister(QnaAnsVO qavo, RedirectAttributes re,
				@RequestParam(name="files", required = false)MultipartFile[] files) {
			log.info(" >>>>> qna-ans register "+qavo+" "+files);
			List<FileVO> flist = null;
			if(files[0].getSize() > 0) {
				String category ="qna";
				flist = fh.uploadFiles(files,category);
			}
			int isOk = qsv.qnaAnsRegister(new QnaAnsDTO(qavo, flist));
			log.info(">>>>> qna-ans register >> "+(isOk > 0? "OK" : "Fail"));
			return "redirect:/qna/detail?qnaNum="+qavo.getQnaNum();
		}
		
		
		@PostMapping("/ans-modify")
		public String qnaAnsModify(QnaAnsVO qavo, RedirectAttributes re,
				@RequestParam(name="files", required = false)MultipartFile[] files) {
			log.info(" >>>>>qna-ans modify "+qavo+" "+files);
			
			List<FileVO> flist = null;
			if(files[0].getSize() > 0) {
				String category ="qna";
				flist = fh.uploadFiles(files,category);
			}
			QnaAnsDTO qadto = new QnaAnsDTO(qavo, flist);
			int isUp = qsv.qnaAnsFileModify(qadto);
			log.info(">>>>> qna-ans modify >> "+(isUp > 0? "OK" : "Fail"));
			re.addFlashAttribute("isUp",isUp);
			return "redirect:/qna/detail?qnaNum="+qavo.getQnaNum();
		}
		
		
	

}
