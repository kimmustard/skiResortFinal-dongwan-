package com.web.www.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
		log.info(rvo+"<<<<<<rvo");
		int isOK= hsv.addRoom(rvo);
		
		return "/hotel/management";
	}
	@GetMapping("modifyRoom")
	public String modifyRoom(Model m) {
		List<RoomVO> roomList = hsv.getRoomList();
		m.addAttribute("roomList", roomList);
		return "/hotel/modifyRoom";
	}
	
}
