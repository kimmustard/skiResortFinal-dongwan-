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
	
    public void naverLogout(String string) {
    	
		String data = "grant_type=delete"+
				"&client_id="+CLIENT_ID+
				"&client_secret="+CLIENT_SECRET+
				"&access_token="+string +
				"&service_provider=NAVER";
		
		sendRevokeRequest(data, "naver", null);
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
	              log.info("#### 테스트 = {}", revokeUrl);
	              break;
          }
          
          ResponseEntity<String> responseEntity = restTemplate.exchange(revokeUrl, HttpMethod.POST, entity, String.class);

          // Get the response status code and body
          HttpStatus statusCode = (HttpStatus) responseEntity.getStatusCode();
          String responseBody = responseEntity.getBody();
          
          log.info("Logout Status Code = {} " , statusCode);
          log.info("Logout Response = {} " , responseBody);
      }
    
 
}
