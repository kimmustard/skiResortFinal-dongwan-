package com.web.www.oauth;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/oauth/*")
@RequiredArgsConstructor
public class OauthLoginController {

	/**
	 * @네이버
	 */
    private final NaverLoginBO naverLoginBO;
    private String apiResult = null;

    //네이버 로그인 성공시 callback호출 메소드
    @RequestMapping(value = "/naver/callback", method = { RequestMethod.GET, RequestMethod.POST })
    public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
            throws IOException {
        OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        //로그인 사용자 정보를 읽어온다.
        apiResult = naverLoginBO.getUserProfile(oauthToken);
        log.info("test@@@@@ ",naverLoginBO.getUserProfile(oauthToken).toString());
        model.addAttribute("result", apiResult);
        log.info("callback result = {}",apiResult);
        
        return "index";
    }
}
