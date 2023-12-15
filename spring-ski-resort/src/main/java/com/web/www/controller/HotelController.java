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
import com.web.www.domain.hotel.RoomDetailImageVO;
import com.web.www.domain.hotel.RoomInfoVO;
import com.web.www.domain.hotel.RoomVO;
import com.web.www.domain.member.AuthUser;
import com.web.www.domain.member.MemberVO;
import com.web.www.domain.pay.PayInfoVO;
import com.web.www.domain.pay.RefundInfoVO;
import com.web.www.service.HotelService;
import com.web.www.service.MemberService;
import com.web.www.service.PayService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/hotel/*")
@RequiredArgsConstructor
public class HotelController {
	
	private final HotelService hsv;
	private final MemberService msv; 

	/*
	 * 예약페이지 매핑
	 */
	@GetMapping("/reservation")
	public String reservForm(Model m, @AuthUser MemberVO mvo) {
		List<RoomVO> roomList = hsv.getRoomList();
		if(mvo ==null) {
			return "index";
		}
		mvo.setMemberGrade(msv.getMemberGrade(mvo.getMemberNum()));	//멤버 등급 가져오기
		List<RoomDetailImageVO> imageList = hsv.getimageList();
		m.addAttribute("roomList", roomList);
		m.addAttribute("imageList", imageList);
		m.addAttribute("mvo", mvo);
		return "/hotel/reservation";
	}

	@PostMapping("/reservation")
	public String reservation(RoomInfoVO rivo, PayInfoVO pivo, RedirectAttributes attributes) throws IOException {
		
		String paySuccessUrl;
		int isOk = hsv.updateRoomInfo(rivo);
		String encodedPayName = URLEncoder.encode(pivo.getPayName(), StandardCharsets.UTF_8);
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("/pay/PaySuccess")
				.queryParam("payMerchantUid", pivo.getPayMerchantUid()).queryParam("payName", encodedPayName)
				.queryParam("payAmount", pivo.getPayAmount());

		paySuccessUrl = "redirect:" + builder.build().toUriString();

		return paySuccessUrl;
	}
	@GetMapping("/roomDetail")
	public String roomDetail(int roomNum,Model m) {
		RoomVO rvo = hsv.getRoomDetail(roomNum);
		RoomDetailImageVO rivo = hsv.getRoomDetailImageVO(roomNum);
		m.addAttribute("rvo",rvo);
		m.addAttribute("rivo",rivo);
		return "/hotel/roomDetail";
	}
	
	@PostConstruct
	public void addRoomList() {
		int roomCnt = hsv.selectRoomCnt();
		
		if (roomCnt == 0) {
			List<RoomVO> roomList = new ArrayList<RoomVO>();
			roomList.add(new RoomVO("스탠다드 더블", "원룸(싱글2),욕실", 2, "nomal", "32.4㎡", 80000, 10, 10));
			roomList.add(new RoomVO("스탠다드 온돌", "원룸(온돌),욕실", 3, "nomal", "32.39㎡", 108000, 10, 10));
			roomList.add(new RoomVO("레이크 플로어 더블", "원룸(더블1),욕실", 4, "nomal", "62.39㎡", 105600, 5, 5));
			roomList.add(new RoomVO("스위트 더블", "침실(더블1),욕실,거실", 2, "nomal", "40.15㎡", 144000, 5, 5));
			roomList.add(new RoomVO("마운틴 스위트 더블", "침실(싱글2),욕실,거실", 2, "nomal", "60.15㎡", 144000, 5, 5));
			roomList.add(new RoomVO("마운틴 디럭스룸", "침실1,온돌1,욕실(1or2),거실 겸 주방", 5, "nomal", "109.22㎡", 132000, 5, 5));
			roomList.add(new RoomVO("마운틴 패밀리 가든", "침실1,온돌1,욕실(2),거실 겸 주방", 6, "nomal", "169.31㎡", 181500, 3, 3));
			roomList.add(new RoomVO("vip 프리미어 스위트 더블", "침실(더블1),욕실,거실", 2, "vip", "56.9㎡", 160000, 3, 3));
			roomList.add(new RoomVO("vip 패밀리 더블", "침실(더블1),욕실,거실", 2, "vip", "71.26㎡", 144000, 3, 3));
			roomList.add(new RoomVO("vip 스카이 플로어", "침실(더블2),욕실(2),거실 겸 주방", 4, "vip", "83.1㎡", 217000, 3, 3));
			List<RoomDetailImageVO> imageList =  new ArrayList<RoomDetailImageVO>();
			imageList.add(new RoomDetailImageVO(1,"https://i.imgur.com/0ZMn0Mo.jpg","https://i.imgur.com/ZN1F71F.jpg","https://i.imgur.com/5NvAFrV.jpg","https://i.imgur.com/znInQ1b.jpg"));
			imageList.add(new RoomDetailImageVO(2,"https://i.imgur.com/aSR5cr6.jpg","https://i.imgur.com/IUN706Q.jpg","https://i.imgur.com/In4Bjnx.jpg","https://i.imgur.com/d9g2nqX.jpg"));
			imageList.add(new RoomDetailImageVO(3,"https://i.imgur.com/qOYBhA6.jpg","https://i.imgur.com/yn5TknJ.jpg","https://i.imgur.com/qskgOj3.jpg","https://i.imgur.com/1gxjT61.jpg"));
			imageList.add(new RoomDetailImageVO(4,"https://i.imgur.com/jveUvWC.jpg","https://i.imgur.com/PHBaczI.jpg","https://i.imgur.com/382hvnh.jpg","https://i.imgur.com/AFpvXRt.jpg"));
			imageList.add(new RoomDetailImageVO(5,"https://i.imgur.com/ZtV6ib8.jpg","https://i.imgur.com/MdvzlPm.jpg","https://i.imgur.com/B0KGw0W.jpg","https://i.imgur.com/AUI5Sbk.jpg"));
			imageList.add(new RoomDetailImageVO(6,"https://i.imgur.com/L6URq41.jpg","https://i.imgur.com/ol8yDfF.jpg","https://i.imgur.com/0CLl1J8.jpg","https://i.imgur.com/DaU0MOG.jpg"));
			imageList.add(new RoomDetailImageVO(7,"https://i.imgur.com/FoKGPAp.jpg","https://i.imgur.com/NjJnqLE.jpg","https://i.imgur.com/DGXlomM.jpg","https://i.imgur.com/CfVWx0X.jpg"));
			imageList.add(new RoomDetailImageVO(8,"https://i.imgur.com/9aL5pZv.jpg","https://i.imgur.com/S7U0sZL.jpg","https://i.imgur.com/j1Cx2FY.jpg","https://i.imgur.com/GbmS4QE.jpg"));
			imageList.add(new RoomDetailImageVO(9,"https://i.imgur.com/5U31syl.jpg","https://i.imgur.com/jhvpUHS.jpg","https://i.imgur.com/pYOX48X.jpg","https://i.imgur.com/CgIubtX.jpg"));
			imageList.add(new RoomDetailImageVO(10,"https://i.imgur.com/V2FAwuX.jpg","https://i.imgur.com/8Lmi5Bx.jpg","https://i.imgur.com/DqBRhoQ.jpg","https://i.imgur.com/xmCczfg.jpg"));
			for (int i = 0; i < roomList.size(); i++) {
				hsv.addRoom(roomList.get(i));
				log.info("어어엄어어엄엉엄준식");
				hsv.addRoomImage(imageList.get(i));
			}
		}

	}

}
