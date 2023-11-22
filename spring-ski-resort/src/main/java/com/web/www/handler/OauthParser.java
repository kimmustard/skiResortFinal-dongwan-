package com.web.www.handler;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Component;

import com.web.www.domain.member.MemberVO;
import com.web.www.security.AuthVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class OauthParser {
	
	public MemberVO naverUser(String apiResult) {
		//2. String형식인 apiResult를 json형태로 바꿈 
		JSONParser parser = new JSONParser(); 
		Object obj;
		try {
			obj = parser.parse(apiResult);
			JSONObject jsonObj = (JSONObject) obj; 
			
			//3. 데이터 파싱 
			//Top레벨 단계 _response 파싱
			JSONObject response_obj = (JSONObject)jsonObj.get("response"); 
			//response의 nickname값 파싱 String
			String id = (String)response_obj.get("id");
			String alias = (String)response_obj.get("nickname");
			String email = (String)response_obj.get("email");
			String phoneNum = (String)response_obj.get("mobile");
			String name = (String)response_obj.get("name");
			
			//pwd 임시로 채울 미니 난수생성
			String pwd = String.valueOf((int)(Math.random() * 899999) + 100000);
			
			//멤버 객체
			MemberVO mvo = new MemberVO();
			mvo.setMemberId(id);
			mvo.setMemberPwd(pwd);
			mvo.setMemberAlias(alias);
			mvo.setMemberEmail(email);
			mvo.setMemberPhoneNum(phoneNum);
			mvo.setMemberName(name);
			mvo.setMemberType("naver");
			//권한 부여
			AuthVO auth = new AuthVO();
			auth.setMemberId(id);
			auth.setAuth("ROLE_USER");
			
			List<AuthVO> authList = new ArrayList<>();
			authList.add(auth);
			mvo.setAuthList(authList);
			
			
			return mvo;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		return null;
	}
	
	
	public MemberVO kakaoUser(String access_Token) throws ParseException {
		
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			JSONParser parser = new JSONParser();
			Object obj = parser.parse(result); 
			JSONObject jsonObj = (JSONObject) obj; 
			JSONObject properties = (JSONObject)jsonObj.get("properties");
			JSONObject kakao_account = (JSONObject)jsonObj.get("kakao_account");
			
			String id = String.valueOf(jsonObj.get("id"));
			String alias = (String) properties.get("nickname");
			String email = (String) kakao_account.get("email");
			String name = (String) kakao_account.get("name");
			String phoneNum = (String) kakao_account.get("phone_number");
			
			//카카오 전화번호는 +82 XXXX 방식으로 넘어오기 때문에 번호 replace가 필요함
			String formattedPhoneNumber = "0" + phoneNum.substring(4);
			log.info("########### = {}", formattedPhoneNumber);
			
			//pwd 임시로 채울 미니 난수생성
			String pwd = String.valueOf((int)(Math.random() * 899999) + 100000);
			
			MemberVO mvo = new MemberVO();
			mvo.setMemberId(id);
			mvo.setMemberPwd(pwd);
			mvo.setMemberAlias(alias);
			mvo.setMemberEmail(email);
			mvo.setMemberPhoneNum(formattedPhoneNumber);
			mvo.setMemberName(name);
			mvo.setMemberType("kakao");
			
			//권한 부여
			AuthVO auth = new AuthVO();
			auth.setMemberId(id);
			auth.setAuth("ROLE_USER");
					
			List<AuthVO> authList = new ArrayList<>();
			authList.add(auth);
			mvo.setAuthList(authList);
		
			return mvo;

		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
		
	}
	
}
