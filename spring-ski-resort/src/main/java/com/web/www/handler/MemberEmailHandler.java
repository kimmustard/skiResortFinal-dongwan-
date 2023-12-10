package com.web.www.handler;

import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ThreadLocalRandom;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class MemberEmailHandler {

	@Autowired
	private JavaMailSender mailSender;
	
	private int authNumber;
	
	public void makeRandomNumber() {
		// 난수의 범위 111111 ~ 999999 (6자리 난수)
		authNumber = ThreadLocalRandom.current().nextInt(111111, 999999 + 1);
	}
	
	//이메일 양식
	public String joinEmail(String email) {
		makeRandomNumber();
		String setFrom = ".com"; // email-config에 설정한 자신의 이메일 주소를 입력 
		String toMail = email;
		String title = "다이스키 리조트 회원가입 인증(key)이메일 입니다."; // 이메일 제목 
		String content = 
				"다이스키 리조트 홈페이지를 방문해주셔서 감사합니다." + 	//html 형식으로 작성 ! 
                "<br><br>" + 
			    "인증 번호는 " + authNumber + "입니다." + 
			    "<br>" + 
			    "해당 인증번호를 인증번호 확인란에 기입하여 주세요."; //이메일 내용 삽입
		mailSend(setFrom, toMail, title, content);
		return Integer.toString(authNumber);
	}
	
	//임시 비밀번호 발송 양식
	public String pwdEmail(String email) {
		makeRandomNumber();
		String setFrom = ".com"; // email-config에 설정한 자신의 이메일 주소를 입력 
		String toMail = email;
		String title = "다이스키 리조트 임시 비밀번호 이메일 입니다.";
		String content = 
				"다이스키 리조트 홈페이지를 방문해주셔서 감사합니다." + 
						"<br><br>" + 
						"임시 비밀번호는 <font color=\"red\" style=\"font-weight:bold;\">" + authNumber + "</font> 입니다." + 
						"<br>" + 
						"해당 비밀번호로 로그인 이후 반드시 비밀번호를 변경해주세요.";
		
		// 임시 비밀번호 보낼때 비동기 처리
		CompletableFuture<Void> future = CompletableFuture.runAsync(() -> {
		        mailSend(setFrom, toMail, title, content);
		    });
		
		// 예외 처리
	    future.exceptionally(ex -> {
	        // 여기에서 예외를 처리하거나 로그에 기록할 수 있습니다.
	        log.error("메일 전송 예외 =  {}", ex.getMessage());
	        return null; // 예외 처리 후에도 CompletableFuture가 완료될 수 있도록 null을 리턴합니다.
	    });
		
		 
		return Integer.toString(authNumber);
	}
	
	//전송 담당
	public void mailSend(String setFrom, String toMail, String title, String content) { 
		MimeMessage message = mailSender.createMimeMessage();
		// true 매개값을 전달하면 multipart 형식의 메세지 전달이 가능.문자 인코딩 설정도 가능하다.
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			// true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
			helper.setText(content,true);
			mailSender.send(message);
		} catch (MessagingException e) {
			log.info("에러코드 발생 = {}",e);
		}
	}
	

}
