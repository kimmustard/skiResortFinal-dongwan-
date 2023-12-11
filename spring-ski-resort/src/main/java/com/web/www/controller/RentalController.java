package com.web.www.controller;

import java.util.List;

import javax.annotation.PostConstruct;

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
import com.web.www.domain.member.AuthUser;
import com.web.www.domain.member.MemberVO;
import com.web.www.domain.rental.RentalItemDTO;
import com.web.www.domain.rental.RentalItemImageRead;
import com.web.www.domain.rental.RentalItemListDTO;
import com.web.www.domain.rental.RentalItemRead;
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
	private final RentalItemRead rir;
	private final RentalItemImageRead rii;

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
	public String liftReservePost(@ModelAttribute("rlivo") RentalLiftVO rlivo, @AuthUser MemberVO mvo) {
		RentalVO rvo = new RentalVO();
		rvo.setRentalLiftNum(rlivo.getRentalLiftNum());
		rvo.setMemberEmail(mvo.getMemberEmail());
		rvo.setMemberType(mvo.getMemberType());
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
		return "/rental/item";
	}
	
	@GetMapping("/ski-item")
	public String skiItemForm(Model model) {
		List<RentalItemListDTO> skiLowItem = rsv.getSkiLowItem();
		List<RentalItemListDTO> skiMidItem = rsv.getSkiMidItem();
		List<RentalItemListDTO> skiPremiumItem = rsv.getSkiPremiumItem();
		
		model.addAttribute("skiLowItem", skiLowItem);
		model.addAttribute("skiMidItem", skiMidItem);
		model.addAttribute("skiPremiumItem", skiPremiumItem);
		
		return "/rental/ski-item";
	}
	@GetMapping("/board-item")
	public String boardItemForm(Model model) {
		List<RentalItemListDTO> boardLowItem = rsv.getBoardLowItem();
		List<RentalItemListDTO> boardMidItem = rsv.getBoardMidItem();
		List<RentalItemListDTO> boardPremiumItem = rsv.getBoardPremiumItem();
		
		model.addAttribute("boardLowItem", boardLowItem);
		model.addAttribute("boardMidItem", boardMidItem);
		model.addAttribute("boardPremiumItem", boardPremiumItem);
		
		return "/rental/board-item";
	}
	@GetMapping("/wear-item")
	public String wearItemForm(Model model) {
		List<RentalItemListDTO> wearLowItem = rsv.getWearLowItem();
		List<RentalItemListDTO> wearMidItem = rsv.getWearMidItem();
		List<RentalItemListDTO> wearPremiumItem = rsv.getWearPremiumItem();
		
		model.addAttribute("wearLowItem", wearLowItem);
		model.addAttribute("wearMidItem", wearMidItem);
		model.addAttribute("wearPremiumItem", wearPremiumItem);
		
		return "/rental/wear-item";
	}
	
	@GetMapping("/item-reserve")
	public String itemReserveForm(Model model) {
		RentalVO rvo = new RentalVO();
		rvo.setRentalMainLift("Y");
		model.addAttribute("rvo", rvo);
		return "/rental/item-reserve";
	}
	
	
	
	
	@PostConstruct
	public void rentalItemCreate() {
		
		int isOk = rsv.rentalItemCntCheck();
		// 테이블에 지역정보가 있는지 확인
		if(isOk == 0) {
			rir.read();
		}
		
	}
	
	@PostConstruct
	public void rentalItemImageCreate() {
		int isOk = rsv.rentalItemImageCntCheck();
		// 테이블에 지역정보가 있는지 확인
		if(isOk == 0) {
			rii.read();
		}
	}
	
	
}