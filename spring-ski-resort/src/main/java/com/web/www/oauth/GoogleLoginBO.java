package com.web.www.oauth;

import java.util.HashMap;
import java.util.Map;

import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
@PropertySource("classpath:outApiProperties.properties")
public class GoogleLoginBO {
	//로그인 전용 url 호출
	
	private static String client_id = "1028808068261-1tj0vod2otlaetbsibbb8kp70o695740.apps.googleusercontent.com";
	private static String client_secret = "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";
	private static String tokenURL = "https://oauth2.googleapis.com/token";
	private static String redirect_uri = "http://localhost:8089/oauth/google/callback";
	private static String login_url = "https://accounts.google.com/o/oauth2/v2/auth?response_type=code"
    		+ "&client_id=" + client_id
            + "&redirect_uri=" + redirect_uri
            + "&scope=email profile";
	
	
	public String getGoogleUrl() {

		return login_url;
	}
	
	
	public Map<String, String> getAccessToken(String code) {
		
		
		MultiValueMap<String, String> parameter = new LinkedMultiValueMap<>();
	    parameter.add("grant_type", "authorization_code");
	    parameter.add("client_id", client_id);
	    parameter.add("client_secret", client_secret);
	    parameter.add("code", code);
	    parameter.add("redirect_uri", redirect_uri);

	    // request header 설정
	    HttpHeaders headers = new HttpHeaders();
	    // Content-type을 application/x-www-form-urlencoded 로 설정
	    headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

	    // header 와 body로 Request 생성
	    HttpEntity<?> entity = new HttpEntity<>(parameter, headers);
	
	    try {
	        RestTemplate restTemplate = new RestTemplate();
	        // 응답 데이터(json)를 Map 으로 받을 수 있도록 관련 메시지 컨버터 추가
	        restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());

	        // Post 방식으로 Http 요청
	        // 응답 데이터 형식은 Hashmap 으로 지정
	        ResponseEntity<HashMap> result = restTemplate.postForEntity(tokenURL, entity, HashMap.class);
	        Map<String, String> resMap = result.getBody();

			// 응답 데이터 확인
	        log.info("응답데이터 = {}",resMap);
	        
			String access_token = resMap.get("access_token");
			String userInfoURL = "https://www.googleapis.com/userinfo/v2/me";
			// Header에 access_token 삽입
			headers.set("Authorization", "Bearer "+access_token);
			
			// Request entity 생성
			HttpEntity<?> userInfoEntity = new HttpEntity<>(headers);
			
			// GET 방식으로 Http 요청
			// 응답 데이터 형식은 Hashmap 으로 지정
			ResponseEntity<HashMap> userResult = restTemplate.exchange(userInfoURL, HttpMethod.GET, userInfoEntity, HashMap.class);
			Map<String, String> userResultMap = userResult.getBody();
			
			return userResultMap;
					   
			} catch (Exception e) {
		        e.printStackTrace();
		    }
	    return null;
	}
}
