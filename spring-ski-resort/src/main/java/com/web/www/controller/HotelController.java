package com.web.www.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponentsBuilder;

import com.web.www.domain.coupon.Coupon;
import com.web.www.domain.hotel.RoomInfoVO;
import com.web.www.domain.hotel.RoomVO;
import com.web.www.domain.member.AuthUser;
import com.web.www.domain.member.MemberVO;
import com.web.www.domain.pay.PayInfoVO;
import com.web.www.domain.pay.RefundInfoVO;
import com.web.www.service.HotelService;
import com.web.www.service.PayService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/hotel/*")
@RequiredArgsConstructor
public class HotelController {

	private final HotelService hsv;
	private final PayService psv;

	/*
	 * 예약페이지 매핑
	 */
	@GetMapping("/reservation")
	public String reservForm(Model m, @AuthUser MemberVO mvo) {
		List<RoomVO> roomList = hsv.getRoomList();
		m.addAttribute("roomList", roomList);
		m.addAttribute("mvo", mvo);

		return "/hotel/reservation";
	}

	@PostMapping("/reservation")
	public String reservation(RoomInfoVO rivo, Coupon cpn, PayInfoVO pivo, RedirectAttributes attributes) throws IOException {
		String paySuccessUrl;
		int isOk = hsv.updateRoomInfo(rivo, cpn);
		String encodedPayName = URLEncoder.encode(pivo.getPayName(), StandardCharsets.UTF_8);
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("/pay/PaySuccess")
				.queryParam("payMerchantUid", pivo.getPayMerchantUid()).queryParam("payName", encodedPayName)
				.queryParam("payAmount", pivo.getPayAmount());

		paySuccessUrl = "redirect:" + builder.build().toUriString();

		return paySuccessUrl;
	}


	
	@PostConstruct
	public void addRoomList() {
		int roomCnt = hsv.selectRoomCnt();
		if (roomCnt == 0) {
			List<RoomVO> roomList = new ArrayList<RoomVO>();
			roomList.add(new RoomVO("스탠다드 트윈", "원룸(싱글2),욕실", 2, "nomal", "32.4㎡", 80000, 10, 10,"https://i.imgur.com/ieaCrx2.jpg"));
			roomList.add(new RoomVO("스탠다드 온돌", "원룸(온돌),욕실", 3, "nomal", "32.39㎡", 108000, 10, 10,"https://i.imgur.com/5vew66I.jpg"));
			roomList.add(new RoomVO("스탠다드 더블온돌", "원룸(더블1),욕실", 4, "nomal", "32.39㎡", 105600, 5, 5,"https://i.imgur.com/6C9HULN.jpg"));
			roomList.add(new RoomVO("스위트 더블", "침실(더블1),욕실,거실", 2, "nomal", "60.15㎡", 144000, 5, 5,"https://i.imgur.com/ltzQR6K.jpg"));
			roomList.add(new RoomVO("스위트 트윈", "침실(싱글2),욕실,거실", 2, "nomal", "60.15㎡", 144000, 5, 5,"https://i.imgur.com/qtBKITz.jpg"));
			roomList.add(new RoomVO("마운틴 디럭스룸", "침실1,온돌1,욕실(1or2),거실 겸 주방", 5, "nomal", "109.22㎡", 132000, 5, 5,"https://i.imgur.com/5KjiVi3.jpg"));
			roomList.add(new RoomVO("마운틴 패밀리 가든", "침실1,온돌1,욕실(2),거실 겸 주방", 6, "nomal", "169.31㎡", 181500, 3, 3,"https://i.imgur.com/SkmoB1Z.jpg "));
			roomList.add(new RoomVO("vip 더블", "침실(더블1),욕실,거실", 2, "vip", "66.2㎡", 160000, 3, 3,"https://i.imgur.com/gITSHC8.jpg"));
			roomList.add(new RoomVO("vip 트윈", "침실(더블1),욕실,거실", 2, "vip", "71.26㎡", 144000, 3, 3,"https://i.imgur.com/nKG4bql.jpg"));
			roomList.add(new RoomVO("vip 더블 온돌", "침실(온돌),욕실,거실", 3, "vip", "63.1㎡", 217000, 3, 3,"https://i.imgur.com/PUxGVtF.jpg"));
			for (int i = 0; i < roomList.size(); i++) {
				hsv.addRoom(roomList.get(i));
				
			}
		}

	}

}
