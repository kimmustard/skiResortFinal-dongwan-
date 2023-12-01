package com.web.www.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.www.domain.hotel.RoomInfoVO;
import com.web.www.domain.hotel.RoomVO;
import com.web.www.service.HotelService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/hotel/*")
@RequiredArgsConstructor
public class HotelController {

	
	private final HotelService hsv;
	private RoomVO rvo = new RoomVO();
	
	/*
	 * 예약페이지 매핑
	 */
	@GetMapping("/reservation")
	public String reservForm() {
		return "/hotel/reservation";
	}
	@PostMapping("/reservation")
	public String reservation(RoomInfoVO rivo){
		int isOk = hsv.updateRoomInfo(rivo);
			return "/hotel/reservation";
	}
	
	@GetMapping("/management")
	public String management() {
		
		
		return "/hotel/management";
	}
	
	@GetMapping("addRoom")
	public String moveaddRoom() {
		
		return "/hotel/addRoom";
	}
	@PostMapping("addRoom")
	public String addRoom(RoomVO rvo) {
		int isOk = hsv.addRoom(rvo);
		return "/hotel/management";
	}
	
	@GetMapping("roomList")
	public String roomList(Model m) {
		List<RoomVO> roomList = hsv.getRoomList();
		m.addAttribute("roomList", roomList);
		return "/hotel/roomList";
	}
	
	@GetMapping("deleteRoom")
	public String deleteRoom(@RequestParam("hotelRoomNum")int hotelRoomNum, RedirectAttributes reatt) {
		log.info(hotelRoomNum+"<<<<<hotelRoomNum");
		int isOk = hsv.deleteRoom(hotelRoomNum);
		reatt.addFlashAttribute("susdel", isOk > 0 ? "y" : "n");
		return "redirect:/hotel/roomList";
	}
	@PostMapping("modifyRoom")
	public String modifyRoom(RoomVO rvo , RedirectAttributes reatt) {
		log.info(rvo+">>>rvo");
		int isOk = hsv.modifyRoom(rvo);
		reatt.addFlashAttribute("susmodi", isOk > 0 ? "y" : "n");
		return "redirect:/hotel/roomList";
	}
	
}
