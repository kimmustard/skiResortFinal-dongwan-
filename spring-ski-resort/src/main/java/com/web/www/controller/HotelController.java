package com.web.www.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.www.domain.hotel.RoomInfoVO;
import com.web.www.domain.hotel.RoomVO;
import com.web.www.domain.member.AuthUser;
import com.web.www.domain.member.MemberVO;
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
	public String reservForm(Model m ,@AuthUser MemberVO mvo) {
		List<RoomVO> roomList = hsv.getRoomList();
		m.addAttribute("roomList", roomList);
		m.addAttribute("mvo", mvo);
	
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
	
	@PostConstruct
	public void addRoomList() {
		int roomCnt = hsv.selectRoomCnt();
		if(roomCnt==0) {
			List<RoomVO> roomList = new ArrayList<RoomVO>();
			roomList.add(new RoomVO("스탠다드 트윈","원룸(싱글2),욕실",2,"nomal","32.4㎡",80000,10));
			roomList.add(new RoomVO("스탠다드 온돌","원룸(온돌),욕실",3,"nomal","32.39㎡",108000,10));
			roomList.add(new RoomVO("스탠다드 더블온돌","원룸(더블1),욕실",4,"nomal","32.39㎡",105600,5));
			roomList.add(new RoomVO("스위트 더블","침실(더블1),욕실,거실",2,"nomal","60.15㎡",144000,5));
			roomList.add(new RoomVO("스위트 트윈","침실(싱글2),욕실,거실",2,"nomal","60.15㎡",144000,5));
			roomList.add(new RoomVO("마운틴 디럭스룸","침실1,온돌1,욕실(1or2),거실 겸 주방",5,"nomal","109.22㎡",132000,5));
			roomList.add(new RoomVO("마운틴 패밀리 가든","침실1,온돌1,욕실(2),거실 겸 주방",6,"nomal","169.31㎡",181500,3));
			roomList.add(new RoomVO("vip 더블","침실(더블1),욕실,거실",2,"vip","46.2㎡",160000,3));
			roomList.add(new RoomVO("vip 트윈","침실(더블1),욕실,거실",2,"vip","41.26㎡",144000,3));
			roomList.add(new RoomVO("vip 온돌","침실(온돌),욕실,거실",3,"vip","53.1㎡",174000,3));
			roomList.add(new RoomVO("vip 더블 온돌","침실(온돌),욕실,거실",3,"vip","63.1㎡",217000,3));
			for(int i = 0 ; i<=roomList.size(); i++) {
				hsv.addRoom(roomList.get(i));
				
			}
		}
		
}
	
}
