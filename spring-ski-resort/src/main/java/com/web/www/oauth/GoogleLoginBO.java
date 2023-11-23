package com.web.www.oauth;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
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
	@Value("${oauth.google.id}")
	private String google_client_id;     
	@Value("${oauth.google.secret}")
	private String google_client_secret;  
	
	public String getGoogleUrl() {
		String tokenURL = "https://oauth2.googleapis.com/token";
		String redirect_uri = "http://localhost:8089/oauth/google/callback";
		String login_url = "https://accounts.google.com/o/oauth2/v2/auth?response_type=code"
	    		+ "&client_id=" + google_client_id
	            + "&redirect_uri=" + redirect_uri
	            + "&scope=email profile";
		return login_url;
	}
	
	
	public Map<String, String> getAccessToken(String code) {
		String tokenURL = "https://oauth2.googleapis.com/token";
		String redirect_uri = "http://localhost:8089/oauth/google/callback";
		String login_url = "https://accounts.google.com/o/oauth2/v2/auth?response_type=code"
	    		+ "&client_id=" + google_client_id
	            + "&redirect_uri=" + redirect_uri
	            + "&scope=email profile";
		
		MultiValueMap<String, String> parameter = new LinkedMultiValueMap<>();
	    parameter.add("grant_type", "authorization_code");
	    parameter.add("client_id", google_client_id);
	    parameter.add("client_secret", google_client_secret);
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
