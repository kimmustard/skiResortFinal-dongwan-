package com.web.www.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.web.www.domain.pay.PayInfoVO;
import com.web.www.domain.pay.RefundInfoVO;
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
	@Override
	public ResponseEntity<String> registerPay(PayInfoVO upiDTO, Principal principal) throws IOException {

	
	// 1. 아임포트 API 키와 SECRET키로 토큰을 생성
		String access_token = getToken();
		log.info("아임포트 엑세스 토큰값 확인 = {}", access_token);
    
	// 2. 토큰으로 결제 완료된 주문정보를 가져옴
		//amount는 결제완료된 금액입니다.
		long amount = paymentInfo(upiDTO.getPayImpUid(), access_token);
		
		
    
	/***********DB 등록 전  비즈니스 로직 영역 (할인율 등)*********/
	
			
	    // 3. 로그인이 안된 유저 return (시큐리티에서 cut하지만 안전을 위해)
		
	    
	    //금액확인

		/**
		 * @if문 태워서 빠져나가는 로직 구성하면 됩니다.
		 * 단, 환불 or 결제여부에 따라 기존물품 갯수 +,-1을 꼭 해주세요
		 * */
		
		
		/*실패시*/
//		payMentCancel(access_token, upiDTO.getPayImpUid(), amount, "무슨 이유로 에러발생");
//		return new ResponseEntity<String>("결제 금액 오류, 결제 취소", HttpStatus.BAD_REQUEST);
		
		/*성공시*/
		pdao.registerPay(upiDTO);
		return new ResponseEntity<String>("주문이 완료되었습니다", HttpStatus.OK);
		//임시 리턴 위에 구성이 되면 삭제하세요.
//		return null;
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
	@Override
	public ResponseEntity<String> payMentRefund(RefundInfoVO rfiVO) throws IOException {
		
		/********** 환불 비즈니스 로직 **************/
		
		//1. 로그인이 안된 유저 return
		
		//2. 이미 취소된 내역이면 return
		if(pdao.payStatusCheck(rfiVO.getPayMerchantUid()) != 0) {
			return new ResponseEntity<String>("이미 취소된 내역입니다.", HttpStatus.BAD_REQUEST);
		}
		//3. 상품 환불가능기간 하루전 기간이 지났으면 return
		
		
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
