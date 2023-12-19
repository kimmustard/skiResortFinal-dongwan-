package com.web.www.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
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
import com.web.www.service.MemberService;
import com.web.www.service.PayService;
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
	private final PayService psv;
	private final MemberService msv;

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
		List<RentalItemListDTO> boardLowItem = rsv.getBoardLowItem();
		List<RentalItemListDTO> boardMidItem = rsv.getBoardMidItem();
		List<RentalItemListDTO> boardPremiumItem = rsv.getBoardPremiumItem();
		List<RentalItemListDTO> wearLowItem = rsv.getWearLowItem();
		List<RentalItemListDTO> wearMidItem = rsv.getWearMidItem();
		List<RentalItemListDTO> wearPremiumItem = rsv.getWearPremiumItem();
		
		model.addAttribute("skiLowItem", skiLowItem);
		model.addAttribute("skiMidItem", skiMidItem);
		model.addAttribute("skiPremiumItem", skiPremiumItem);
		model.addAttribute("boardLowItem", boardLowItem);
		model.addAttribute("boardMidItem", boardMidItem);
		model.addAttribute("boardPremiumItem", boardPremiumItem);
		model.addAttribute("wearLowItem", wearLowItem);
		model.addAttribute("wearMidItem", wearMidItem);
		model.addAttribute("wearPremiumItem", wearPremiumItem);
		
		model.addAttribute("mvo", mvo);
		model.addAttribute("rlivo", rlivo);
		
		return "/rental/ski-item";
	}
	
	@GetMapping("/item-reserve")
	public String itemsPayForm(@RequestParam(name = "data", required = false) String data, 
			@AuthUser MemberVO mvo,RedirectAttributes rttr ,Model model) {
		
		//결제전 유저등급 갱신
		mvo.setMemberGrade(msv.getMemberGrade(mvo.getMemberNum()));
		
		RentalLiftVO rlVO = rsv.getRentalLift(mvo.getMemberNum());
		log.info("잘얻어졌나요 ? = {}", rlVO);
		
		if(rlVO == null) {
			
			rttr.addFlashAttribute("isOk", 1);
			return "redirect:/rental/reserve";
		}
		
		int sum = 0;
		String payName = "";
		
	    if (data != null) {
	        try {
	        	//역직렬화
	            ObjectMapper objectMapper = new ObjectMapper();
	            List<RentalItemsBasketDTO> rtiList = 
	            		objectMapper.readValue(data, new TypeReference<List<RentalItemsBasketDTO>>() {});
	            model.addAttribute("rtiList", rtiList);
	            
	            //상품명 파싱 로직
	            payName = rtiList.get(0).getRentalItemName()+" 외"+(rtiList.size()-1)+"종";
	            for (RentalItemsBasketDTO temp : rtiList) {
	            	sum += temp.getRentalItemPrice();
	            }
	        } catch (IOException e) {
	            log.info("에러발생", e);
	        }
	    }
	    
	    model.addAttribute("rlVO", rlVO);
	    model.addAttribute("mvo", mvo);
	    model.addAttribute("sum", sum);
	    model.addAttribute("payName", payName);
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