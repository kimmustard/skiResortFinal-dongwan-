package com.web.www.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.www.domain.FileVO;
import com.web.www.domain.member.MemberVO;
import com.web.www.domain.rental.RentalItemDTO;
import com.web.www.domain.rental.RentalItemVO;
import com.web.www.domain.rental.RentalLiftVO;
import com.web.www.domain.rental.RentalVO;
import com.web.www.handler.FileHandler;
import com.web.www.service.RentalService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/rental/*")
@RequiredArgsConstructor
public class RentalController {
	
	private final RentalService rsv;
	
	private final FileHandler fh;

	@GetMapping("/fee-info")
	public String rentalForm() {
		
		return "/rental/fee-info"; 
	}
	
	@GetMapping("/reserve")
	public String reserveForm(@ModelAttribute("mvo")MemberVO mvo) {
		log.info("MemberController mvo = {}" , mvo);
		return "/rental/reserve";
	}
	
	@PostMapping("/reserve")
	public String liftReservePost(@ModelAttribute("rlivo") RentalLiftVO rlivo, HttpSession ses) {
		log.info("rlivo = {}",rlivo);
		String memberEmail = (String)ses.getAttribute("memberEmail");
		String memberType = (String)ses.getAttribute("memberType");
		log.info("memberEmail = {}",memberEmail);
		log.info("memberType = {}",memberType);
		RentalVO rvo = new RentalVO();
		rvo.setRentalLiftNum(rlivo.getRentalLiftNum());
		rvo.setMemberEmail(memberEmail);
		rvo.setMemberType(memberType);
		int isOk = rsv.liftReserve(rlivo);
		isOk = rsv.rental(rvo);
		log.info((isOk > 0)? "ok":"fail");
		return "index";
	}
	
	
	
	@GetMapping("/item-register")
	public String itemRegisterForm() {
		
		return "/rental/item-register";
	}
	
	@PostMapping("/item-register")
	public String itemRegister(RentalItemVO ritvo, RedirectAttributes re,
			@RequestParam(name = "files", required = false)MultipartFile[] files) {
		log.info("ritvo = {}",ritvo);
		List<FileVO> flist = null;
		if(files[0].getSize() > 0) {
			String category = "rental";
			flist = fh.uploadFiles(files, category);
		}
		int isOk = rsv.itemRegister(new RentalItemDTO(ritvo,flist));
		log.info((isOk > 0)? "ok":"fail");
		return "redirect:/rental/item";
	}

	@GetMapping("/item")
	public String itemForm(Model model) {
		List<RentalItemVO> list = rsv.itemList();
		model.addAttribute("list", list);
		return "/rental/item";
	}
	
}