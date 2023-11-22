package com.web.www.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.social.connect.ConnectionFactory;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.OAuth2Parameters;

@Configuration
public class GoogleSocialConfig {
		
	// 구글OAuth 클라이언트 아이디,비밀번호
	@Bean
    public ConnectionFactory<?> googleConnectionFactory() {
        return new GoogleConnectionFactory("1028808068261-1tj0vod2otlaetbsibbb8kp70o695740.apps.googleusercontent.com",
        		"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");
    }

	//승인된 URL과 리디렉션 URI
    @Bean
    public OAuth2Parameters googleOAuth2Parameters() {
        OAuth2Parameters parameters = new OAuth2Parameters();
        parameters.setScope("https://www.googleapis.com/auth/plus.login");
        parameters.setRedirectUri("http://localhost:8089/oauth/google/callback");
        return parameters;
    }
}
