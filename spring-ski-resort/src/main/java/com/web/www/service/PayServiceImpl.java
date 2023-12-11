package com.web.www.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.web.www.domain.alarm.AlarmVO;
import com.web.www.domain.pay.PayInfoVO;
import com.web.www.domain.pay.RefundInfoVO;
import com.web.www.repository.AlarmDAO;
import com.web.www.repository.PayDAO;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@PropertySource("classpath:outApiProperties.properties")
@RequiredArgsConstructor
public class PayServiceImpl implements PayService{
	
	private final PayDAO pdao;
	private final AlarmDAO adao;
	private final HotelService hsv;
	
	@Value("${pay.imp}")
	private String imp_uid;
	
	@Value("${pay.key}")
	private String imp_key;
	
	@Value("${pay.secret}")
	private String imp_secret;
	
	@ToString
	@Getter
	private class Response{
		private PaymentInfo response;
	}
	
	@ToString
	@Getter
	private class PaymentInfo{
		private long amount;
	}
	
	/**
	 * @return 
	 * @throws IOException 
	 * @Method 결제정보 DB저장
	 */
	@Transactional
	@Override
	public ResponseEntity<String> registerPay(PayInfoVO pivo) throws IOException {
		
		// 1. 아임포트 API 키와 SECRET키로 토큰을 생성
			String access_token = getToken();
			log.info("아임포트 엑세스 토큰값 확인 = {}", access_token);
	    
		// 2. 토큰으로 결제 완료된 주문정보를 가져옴
			//amount는 결제완료된 금액입니다.
			long amount = paymentInfo(pivo.getPayImpUid(), access_token);
			
			
			
	/***********DB 등록 전  비즈니스 로직 영역 (할인율 등)*********/
		/*+개선해야할점 호텔/리프트/장비/ 3가지로 switch문(수문장) 나눠서 각자 if문을 타게 하던가 하는게 좋았을듯? +*/
		
	    //[호텔]방이없을때 return
		int cheakRoomCount = hsv.cheakRoomCount(pivo.getHotelRoomNum());// 쓸때없이 타야함.
		if (cheakRoomCount <= 0) {
			payMentCancel(access_token, pivo.getPayImpUid(), amount, "이용 가능한 방이 없습니다.");
			adao.alarmSetting(new AlarmVO(pivo.getMemberNum(), 4, "취소"));// 시스템 알람 반드시 넣어주세요.
			return new ResponseEntity<String>("이용 가능한 방이 없습니다.", HttpStatus.BAD_REQUEST);
		}
		
		//[렌탈]장비가 없을때 return
		
	
		//[호텔] 이미 구매 했으면 return (멤버번호로(room_info) cnt 조회하면 한방에 끝날듯)
		
	    

		/**
		 * @if문 태워서 빠져나가는 로직 구성하면 됩니다.
		 * 단, 환불 or 결제여부에 따라 기존물품 개수 갱신 로직을 꼭 해주세요
		 * */
		
		
		/*실패시(복붙용)*/
//		payMentCancel(access_token, upiDTO.getPayImpUid(), amount, "카드회사에 전달할 사유");
//		return new ResponseEntity<String>("취소사유", HttpStatus.BAD_REQUEST);
		
		/*성공시*/
		pdao.registerPay(pivo);
		adao.alarmSetting(new AlarmVO(pivo.getMemberNum() , 2, "결제"));// 시스템 알람 반드시 넣어주세요.
		log.info("결제알람체크");
		return new ResponseEntity<String>("결제완료", HttpStatus.OK);
		
	/*********************************/
	}

	/**
	 * @Method 회원 결제정보 리스트
	 */
	@Override
	public List<PayInfoVO> getPayInfoList(long memberNum) {
		return pdao.getPayInfoList(memberNum);
	}

	/**
	 * @throws IOException 
	 * @Method 환불
	 */
	@Transactional
	@Override
	public ResponseEntity<String> payMentRefund(RefundInfoVO rfiVO, long memberNum) throws IOException {
		
		/********** 환불 비즈니스 로직 **************/
		
		//[공통] 이미 취소된 내역이면 return
		if(pdao.payStatusCheck(rfiVO.getPayMerchantUid()) != 0) {
			return new ResponseEntity<String>("이미 취소된 내역입니다.", HttpStatus.BAD_REQUEST);
		}
		//[공통] 상품 환불가능기간 하루전 기간이 지났으면 return
		
		//[호텔] 환불시 room_info 테이블 삭제 로직
		
		//[렌탈] 환불시 테이블 삭제 로직
		
		//[리프트] 환불시 테이블 삭제 로직
		
		
		
		
		/***************************************/
		
		
		// 로직 통과하면 정상 진행
		String access_token = getToken();
		
		// 카드회사에서 "결제금액" 내역 가져오기
		long amount = paymentInfo(rfiVO.getPayImpUid(), access_token);
		
		/* 환불하려는 금액과 결제정보내 금액이 같은지 확인 if문 해도될듯? */
		
		//카드회사로 환불요청 보내기
		payMentCancel(access_token, rfiVO.getPayImpUid(), amount, rfiVO.getRefundReason());
		
		
		/**
		 * @pado.registerRefund 환불된 내역 DB에 저장
		 * @pdao.payMentRefund 결제내역중 결제상태를 '결제취소' 로 변경
		 */
		pdao.registerRefund(rfiVO);
		pdao.payMentRefund(rfiVO.getPayImpUid());
		adao.alarmSetting(new AlarmVO(memberNum, 3, "환불"));// 시스템 알람 반드시 넣어주세요.
		log.info("환불알람체크");
		return new ResponseEntity<String>("정상적으로 환불되었습니다.", HttpStatus.OK);
	}
	
	
	//아임포트 엑세스 토큰 가져오기
	public String getToken() throws IOException {
		
		HttpsURLConnection conn = null;
		URL url = new URL("https://api.iamport.kr/users/getToken");
		 
		conn = (HttpsURLConnection) url.openConnection();

		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-type", "application/json");
		conn.setRequestProperty("Accept", "application/json");
		conn.setDoOutput(true);
		JsonObject json = new JsonObject();

		json.addProperty("imp_key", imp_key);
		json.addProperty("imp_secret", imp_secret);
		
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		
		bw.write(json.toString());
		bw.flush();
		bw.close();

		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));

		Gson gson = new Gson();

		String response = gson.fromJson(br.readLine(), Map.class).get("response").toString();
		
		System.out.println(response);

		String token = gson.fromJson(response, Map.class).get("access_token").toString();

		br.close();
		conn.disconnect();

		return token;
	}
	
	//결제정보 가져오기
	public long paymentInfo(String imp_uid, String access_token) throws IOException {
		
	    HttpsURLConnection conn = null;
	 
	    URL url = new URL("https://api.iamport.kr/payments/" + imp_uid);
	 
	    conn = (HttpsURLConnection) url.openConnection();
	 
	    conn.setRequestMethod("GET");
	    conn.setRequestProperty("Authorization", access_token);
	    conn.setDoOutput(true);
	 
	    BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
	    
	    Gson gson = new Gson();
	    
	    Response response = gson.fromJson(br.readLine(), Response.class);
	    
	    br.close();
	    conn.disconnect();
	    
	    return response.getResponse().getAmount();
	}
	
	//결제취소
	public void payMentCancel(String access_token, String imp_uid, long amount, String reason) throws IOException  {
		log.info("결제 취소 진입합니다.");
		log.info(access_token);
		log.info(imp_uid);
		
		HttpsURLConnection conn = null;
		URL url = new URL("https://api.iamport.kr/payments/cancel");
 
		conn = (HttpsURLConnection) url.openConnection();
 
		conn.setRequestMethod("POST");
 
		conn.setRequestProperty("Content-type", "application/json");
		conn.setRequestProperty("Accept", "application/json");
		conn.setRequestProperty("Authorization", access_token);
 
		conn.setDoOutput(true);
		
		JsonObject json = new JsonObject();
 
		json.addProperty("reason", reason);
		json.addProperty("imp_uid", imp_uid);
		json.addProperty("amount", amount);
		json.addProperty("checksum", amount);
 
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
 
		bw.write(json.toString());
		bw.flush();
		bw.close();
		
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
 
		br.close();
		conn.disconnect();
		
		
	}
	
}
