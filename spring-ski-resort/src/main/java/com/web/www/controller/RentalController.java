package com.web.www.controller;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponentsBuilder;

import com.web.www.domain.FileVO;
import com.web.www.domain.member.AuthUser;
import com.web.www.domain.member.MemberVO;
import com.web.www.domain.pay.PayInfoVO;
import com.web.www.domain.rental.RentalItemDTO;
import com.web.www.domain.rental.RentalItemImageRead;
import com.web.www.domain.rental.RentalItemListDTO;
import com.web.www.domain.rental.RentalItemRead;
import com.web.www.domain.rental.RentalItemVO;
import com.web.www.domain.rental.RentalItemsBasketDTO;
import com.web.www.domain.rental.RentalLiftVO;
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
	public String reserveForm(@AuthUser MemberVO mvo , Model m) {
		log.info("MemberController mvo = {}" , mvo);
		m.addAttribute("mvo", mvo);
		return "/rental/reserve";
	}
	
	@PostMapping("/reserve")
	public String liftReservePost(RentalLiftVO rlivo, @AuthUser MemberVO mvo ,PayInfoVO pivo, RedirectAttributes attributes) {
		log.info("rlivo>>>>>>>>>>>>>>>>>>>>>"+rlivo);
		String paySuccessUrl;
		//결제 db
		int isOk =rsv.updateRentalLift(rlivo ,mvo);;
		String encodedPayName = URLEncoder.encode(pivo.getPayName(), StandardCharsets.UTF_8);
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("/pay/PaySuccess")
				.queryParam("payMerchantUid", pivo.getPayMerchantUid()).queryParam("payName", encodedPayName)
				.queryParam("payAmount", pivo.getPayAmount());

		paySuccessUrl = "redirect:" + builder.build().toUriString();

		return paySuccessUrl;
		
		//결제하고 
//		if(isOk == 1) {
//		rvo.setRentalLiftNum(rlivo.getRentalLiftNum());
//		rvo.setMemberEmail(mvo.getMemberEmail());
//		rvo.setMemberType(mvo.getMemberType());
//		isOk *= rsv.liftReserve(rlivo);
//		isOk = rsv.rental(rvo);
//		log.info((isOk > 0)? "ok":"fail");
//		}
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
	public String skiItemForm(Model model, @AuthUser MemberVO mvo, RentalLiftVO rlivo) {
		List<RentalItemListDTO> skiLowItem = rsv.getSkiLowItem();
		List<RentalItemListDTO> skiMidItem = rsv.getSkiMidItem();
		List<RentalItemListDTO> skiPremiumItem = rsv.getSkiPremiumItem();
		
		model.addAttribute("skiLowItem", skiLowItem);
		model.addAttribute("skiMidItem", skiMidItem);
		model.addAttribute("skiPremiumItem", skiPremiumItem);
		model.addAttribute("mvo", mvo);
		model.addAttribute("rlivo", rlivo);
		
		return "/rental/ski-item";
	}
	@GetMapping("/board-item")
	public String boardItemForm(Model model, @AuthUser MemberVO mvo) {
		List<RentalItemListDTO> boardLowItem = rsv.getBoardLowItem();
		List<RentalItemListDTO> boardMidItem = rsv.getBoardMidItem();
		List<RentalItemListDTO> boardPremiumItem = rsv.getBoardPremiumItem();
		
		model.addAttribute("boardLowItem", boardLowItem);
		model.addAttribute("boardMidItem", boardMidItem);
		model.addAttribute("boardPremiumItem", boardPremiumItem);
		model.addAttribute("mvo", mvo);
		
		return "/rental/board-item";
	}
	@GetMapping("/wear-item")
	public String wearItemForm(Model model, @AuthUser MemberVO mvo) {
		List<RentalItemListDTO> wearLowItem = rsv.getWearLowItem();
		List<RentalItemListDTO> wearMidItem = rsv.getWearMidItem();
		List<RentalItemListDTO> wearPremiumItem = rsv.getWearPremiumItem();
		
		model.addAttribute("wearLowItem", wearLowItem);
		model.addAttribute("wearMidItem", wearMidItem);
		model.addAttribute("wearPremiumItem", wearPremiumItem);
		model.addAttribute("mvo", mvo);
		
		return "/rental/wear-item";
	}
	
	@PostMapping(value = "/itemsBasket", consumes = MediaType.APPLICATION_JSON_VALUE)
	public String itemsBasketToServer(@RequestBody List<RentalItemsBasketDTO> ritvoList) {
		
	    for (RentalItemsBasketDTO rtibDTO : ritvoList) {
	    	
	        log.info("넘어가는지 확인##### = {}", rtibDTO);
	        
	    }
	    
	    return "index";
	}
	
	
//	@PostMapping("/item-reserve")
//	public String itemReservePost(RentalItemVO ritvo, RentalLiftVO rlivo, RentalReserveVO rrvo,
//			RentalVO rvo, @AuthUser MemberVO mvo, Model model) {
//		
//		rrvo.setRentalLiftNum(rvo.getRentalLiftNum());
//		rrvo.setRentalListItemNum(ritvo.getRentalListItemNum());
//		model.addAttribute("rrvo", rrvo);
//		model.addAttribute("rlivo", rlivo);
//		int isOk = rsv.itemReserve(rrvo);
//		log.info((isOk > 0)? "ok":"fail");
//		
//		return "index";
//		
//	}
	
	
	
	
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