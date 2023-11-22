package com.web.www.oauth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class GoogleLoginBO {
	
	/**
	 * @구글
	 */
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;
	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;
	
	public String getGoogleUrl() {
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
		return url;
	}
	
	public String getAccessToken(String code) {
		
        OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
        String redirectUri = googleOAuth2Parameters.getRedirectUri();
        AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, redirectUri, null);

       
        String access_Token = accessGrant.getAccessToken();

		return access_Token;
	}
}
