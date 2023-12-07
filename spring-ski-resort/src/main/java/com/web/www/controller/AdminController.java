package com.web.www.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.www.domain.coupon.CouponSystem;
import com.web.www.domain.hotel.RoomVO;
import com.web.www.domain.member.AuthUser;
import com.web.www.domain.member.MemberVO;
import com.web.www.repository.AdminDAO;
import com.web.www.service.AdminService;
import com.web.www.service.HotelService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/developer/*")
@RequiredArgsConstructor
public class AdminController {

	private final AdminService asv;
	private final HotelService hsv;
	private final AdminDAO adao;
	
	@GetMapping("/settingMain")
	public String adminPageForm() {
		return "/developer/settingMain";
	}
	
	
	
	/*************************************
	 * @Developer 관리자 페이지 "멤버 관리"
	 *************************************/
	
	@GetMapping("/settingMember")
	public String memberListForm(Model model) {
		List<MemberVO> mvoList =  asv.getMemberList();
		
		for (MemberVO mvo : mvoList) {
			mvo.setAuthList(adao.selectAuths(mvo.getMemberId()));
		}
		
		model.addAttribute("mvoList", mvoList);
		return "/developer/settingMember";
	}
	
	@GetMapping("/authUp/{id}")
	public int authMemberUp(@PathVariable("id")String MemberId) {
		int isOk = asv.authUp(MemberId);
		return isOk;
	}
	
	@GetMapping("/authDown/{id}")
	public int authMemberDown(@PathVariable("id")String MemberId) {
		int isOk = asv.authDown(MemberId);
		return isOk;
	}
	
	@GetMapping("/settingCoupon")
	public String couponListForm(Model model) {
		List<CouponSystem> csList = asv.getCouponList();
		model.addAttribute("csList", csList);
		return "/developer/settingCoupon";
	}
	
	
	/*************************************
	 * @Developer 관리자 페이지 "호텔 관리"
	 *************************************/
	
	@GetMapping("/settingHotel")
	public String hotelListForm(Model m ,@AuthUser MemberVO mvo) {
		List<RoomVO> roomList = hsv.getRoomList();
		m.addAttribute("roomList", roomList);
		m.addAttribute("mvo", mvo);
		return "/developer/settingHotel";
	}
	
	@PostMapping("/addRoom")
	public String addRoom(RoomVO rvo) {
		int isOk = hsv.addRoom(rvo);
		return "redirect:/developer/settingHotel";
	}
	@GetMapping("deleteRoom")
	public String deleteRoom(@RequestParam("hotelRoomNum") int hotelRoomNum, RedirectAttributes reatt) {
		log.info(hotelRoomNum + "<<<<<hotelRoomNum");
		int isOk = hsv.deleteRoom(hotelRoomNum);
		reatt.addFlashAttribute("susdel", isOk > 0 ? "y" : "n");
		return "redirect:/developer/settingHotel";
	}
	@PostMapping("modifyRoom")
	public String modifyRoom(RoomVO rvo, RedirectAttributes reatt) {
		log.info(rvo + ">>>rvo");
		int isOk = hsv.modifyRoom(rvo);
		reatt.addFlashAttribute("susmodi", isOk > 0 ? "y" : "n");
		return "redirect:/developer/settingHotel";
	}
	
	
	
	/*************************************
	 * @Developer 관리자 페이지 "렌탈/리프트 관리"
	 *************************************/
	
	
	
	
	
	
	/*************************************
	 * @Developer 관리자 페이지 "게시판 관리"
	 *************************************/
	
}
