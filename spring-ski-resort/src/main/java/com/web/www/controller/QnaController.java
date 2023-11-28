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

import com.web.www.domain.FileVO;
import com.web.www.domain.board.PagingVO;
import com.web.www.domain.board.QnaVO;
import com.web.www.domain.board.qnaDTO;
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
	
	
	
	@GetMapping("/register")
	public String qnaRegister() {
		return "/qna/register";
	}
	
	
	//파일업로드 추가
	@PostMapping("/register")
	public String noticeRegister(QnaVO qvo, RedirectAttributes re,
			@RequestParam(name="files", required = false)MultipartFile[] files) {
		log.info(" >>>>> register "+qvo+" "+files);
		List<FileVO> flist = null;
		if(files[0].getSize() > 0) {
			String category ="qna";
			flist = fh.uploadFiles(files,category);
		}
		int isOk = qsv.qnaRegister(new qnaDTO(qvo, flist));
		log.info(">>>>> qna register >> "+(isOk > 0? "OK" : "Fail"));
		return "redirect:/qna/list";
	}
	
	
	
	@GetMapping("/list")
	public void qnaList(Model m, PagingVO pgvo) {
		m.addAttribute("list", qsv.qnaList(pgvo));
		int totalCount = qsv.getTotalCount(pgvo);
		PagingHandler ph = new PagingHandler(pgvo, totalCount);
		m.addAttribute("ph",ph);
	}
	
	
	

}
