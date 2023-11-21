package com.web.www.handler;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Component
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class OauthParser {
	
	private String id;
	private String alias;
	private String email;
	private String phoneNum;
	private String name;

	public OauthParser(String apiResult) throws ParseException {
	
		//2. String형식인 apiResult를 json형태로 바꿈 
		 JSONParser parser = new JSONParser(); 
		 Object obj = parser.parse(apiResult); 
		 JSONObject jsonObj = (JSONObject) obj; 

		 //3. 데이터 파싱 
		 //Top레벨 단계 _response 파싱 
		 JSONObject response_obj = (JSONObject)jsonObj.get("response"); 
		 //response의 nickname값 파싱 String
		 this.id = (String)response_obj.get("id");
		 this.alias = (String)response_obj.get("nickname");
		 this.email = (String)response_obj.get("email");
		 this.phoneNum = (String)response_obj.get("mobile");
		 this.name = (String)response_obj.get("name");
	}

	
	
}
