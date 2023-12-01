package com.web.www.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.web.www.domain.pay.PayInfoVO;
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
	public ResponseEntity<String> registerPay(PayInfoVO upiDTO) throws IOException {

	
	// 1. 아임포트 API 키와 SECRET키로 토큰을 생성
		String access_token = getToken();
		log.info("아임포트 엑세스 토큰값 확인 = {}", access_token);
    
	// 2. 토큰으로 결제 완료된 주문정보를 가져옴
		//amount는 결제완료된 금액입니다.
		long amount = paymentInfo(upiDTO.getPayImpUid(), access_token);
		
		
    
	/***********DB 등록 전  비즈니스 로직 영역 (할인율 등)*********/
	
			
	    // 3. 로그인하지 않았는데 사용포인트가 0 이상일경우 결제 취소
	
	    // 4. 로그인 사용자가 현재포인트보다 사용포인트가 많을 경우 결제 취소
	    
	    // 5. DB에서 실제 계산되어야 할 가격가져오기
	    
	    // 6. 결제 완료된 금액과 실제 계산되어야 할 금액이 다를경우 결제 취소
	    
	    // 7. 결제에러시 결제 취소
		
		
		/**
		 * @IF 이프문을 태워서 빠져나가는 로직 구성하면 됩니다.
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
	public int payMentRefund(String payImpUid) throws IOException {
		String access_token = getToken();
		long amount = paymentInfo(payImpUid, access_token);
		payMentCancel(access_token, payImpUid, amount, "환불사유");
		return pdao.payMentRefund(payImpUid);
	}
	
	
	//엑세스 토큰 가져오기
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
		log.info("결제 취소");
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
