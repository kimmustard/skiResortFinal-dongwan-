package com.web.www.handler;

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
	
	public MemberVO naverUser(String apiResult) throws ParseException {
		//2. String형식인 apiResult를 json형태로 바꿈 
		JSONParser parser = new JSONParser(); 
		Object obj = parser.parse(apiResult); 
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
		log.info("pwd@@@@@@@@@@@@ = {}", pwd);
		
		//멤버 객체
		MemberVO mvo = new MemberVO();
		mvo.setMemberId(id);
		mvo.setMemberPwd(pwd);
		mvo.setMemberAlias(alias);
		mvo.setMemberEmail(email);
		mvo.setMemberPhoneNum(phoneNum);
		mvo.setMemberName(name);
		
		//권한 부여
		AuthVO auth = new AuthVO();
		auth.setMemberId(id);
		auth.setAuth("ROLE_USER");
				
		List<AuthVO> authList = new ArrayList<>();
		authList.add(auth);
		mvo.setAuthList(authList);
		
		return mvo;
	}
	
	
}
