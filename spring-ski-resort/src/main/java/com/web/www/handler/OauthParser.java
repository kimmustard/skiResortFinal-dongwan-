package com.web.www.handler;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Component;

import com.web.www.domain.member.OauthMemberVO;
import com.web.www.security.AuthVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class OauthParser {
	
	public OauthMemberVO naverUser(String apiResult) throws ParseException {
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
		
		//멤버 객체
		OauthMemberVO omvo = new OauthMemberVO();
		omvo.setMemberId(id);
		omvo.setMemberPwd(UUID.randomUUID().toString());
		omvo.setMemberAlias(alias);
		omvo.setMemberEmail(email);
		omvo.setMemberPhoneNum(phoneNum);
		omvo.setMemberName(name);
		
		//권한 부여
		AuthVO auth = new AuthVO();
		auth.setMemberId(id);
		auth.setAuth("ROLE_USER");
				
		List<AuthVO> authList = new ArrayList<>();
		authList.add(auth);
		omvo.setAuthList(authList);
		
		return omvo;
	}
	
	
}
