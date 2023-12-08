package com.web.www.oauth;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Component
@PropertySource("classpath:outApiProperties.properties")
public class OauthLogout {
	
	@Value("${oauth.naver.id}")
	private String CLIENT_ID;      //네이버API Client ID
	@Value("${oauth.naver.secret}")
	private String CLIENT_SECRET;      //네이버API Client ID
	
    public void naverLogout(String accessToken) {
    	
		 MultiValueMap<String, String> data = new LinkedMultiValueMap<>();
	     data.add("grant_type", "delete");
	     data.add("client_id", CLIENT_ID);
	     data.add("client_secret", CLIENT_SECRET);
	     data.add("access_token", accessToken);
	     data.add("service_provider", "NAVER");
	
	     sendRevokeRequest2(data, "naver", null);
//		String data = "grant_type=delete"+
//				"&client_id="+CLIENT_ID+
//				"&client_secret="+CLIENT_SECRET+
//				"&access_token="+accessToken;
//		
//		log.info("왜######### = {}", data ); 
//		
//			
//		sendRevokeRequest(data, "naver", null);
	}
    
    public void kakaoLogout(String accessToken) {
    	sendRevokeRequest(null, "kakao", accessToken);
    }
    
    public void googleLogout(String accessToken) {
    	 String data = "token=" + accessToken;

         sendRevokeRequest(data, "google", null);
    }
    
    
    public void sendRevokeRequest(String data, String company, String accessToken) {
          String googleRevokeUrl = "https://accounts.google.com/o/oauth2/revoke";
          String naverRevokeUrl = "https://nid.naver.com/oauth2.0/token";
          String kakaoRevokeUrl = "https://kapi.kakao.com/v1/user/unlink";
    	
          
          RestTemplate restTemplate = new RestTemplate();
          String revokeUrl = "";

          HttpHeaders headers = new HttpHeaders();
          headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

          HttpEntity<String> entity = new HttpEntity<>(data, headers);
          
          switch (company) {
	          case "google":
	              revokeUrl = googleRevokeUrl;
	              break;
	          case "naver":
	              revokeUrl = naverRevokeUrl;
	              break;
	          case "kakao":
	              revokeUrl = kakaoRevokeUrl;
	              headers.setBearerAuth(accessToken);
	              break;
          }
          
          ResponseEntity<String> responseEntity = restTemplate.exchange(revokeUrl, HttpMethod.POST, entity, String.class);

          // Get the response status code and body
          HttpStatus statusCode = (HttpStatus) responseEntity.getStatusCode();
          String responseBody = responseEntity.getBody();
          
          log.info("Logout Status Code = {} " , statusCode);
          log.info("Logout Response = {} " , responseBody);
      }
    
    public void sendRevokeRequest2(MultiValueMap<String, String> data, String company, String accessToken) {
        String naverRevokeUrl = "https://nid.naver.com/oauth2.0/token";

        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

        switch (company) {
            case "naver":
                break;
        }

        HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(data, headers);

        ResponseEntity<String> responseEntity = restTemplate.exchange(naverRevokeUrl, HttpMethod.POST, entity, String.class);

        // 응답 상태 코드와 바디를 가져옵니다.
        int statusCode = responseEntity.getStatusCodeValue();
        String responseBody = responseEntity.getBody();

        log.info("로그아웃 상태 코드 = {} ", statusCode);
        log.info("로그아웃 응답 = {} ", responseBody);
    }
    
}
