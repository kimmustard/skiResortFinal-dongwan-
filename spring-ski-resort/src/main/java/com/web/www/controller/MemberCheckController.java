package com.web.www.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.web.www.domain.member.MemberCheckDTO;
import com.web.www.handler.MemberEmailHandler;
import com.web.www.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/member/check/*")
@RequiredArgsConstructor
public class MemberCheckController {

	private final MemberService msv;
	private final MemberEmailHandler mailService;
	
	@GetMapping(value = "/id/{id}", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> duplicateId(@PathVariable("id")String MemberId){
		int isOk = msv.checkId(MemberId);
		
		return isOk > 0 ? new ResponseEntity<String> ("1", HttpStatus.OK) : 
			new ResponseEntity<String> ("0", HttpStatus.NOT_FOUND);
	}
	
	@GetMapping(value = "/email/{email}", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> duplicateEmail(@PathVariable("email")String MemberEmail){
		int isOk = msv.checkEmail(MemberEmail);
		
		return isOk > 0 ? new ResponseEntity<String> ("1", HttpStatus.OK) : 
			new ResponseEntity<String> ("0", HttpStatus.NOT_FOUND);
	}
	
	@GetMapping(value = "/num/{email}", produces = MediaType.TEXT_PLAIN_VALUE)
	public String emailNumCheck(@PathVariable("email")String MemberEmail){
		log.info("emailNumCheck = {}" , MemberEmail);
		return mailService.joinEmail(MemberEmail);
	}
	
	@PostMapping(value = "/cdcheck", consumes = MediaType.APPLICATION_JSON_VALUE)
	public String cdCheck(@RequestBody MemberCheckDTO mcDto) {
		log.info("광고 체크 = {}" , mcDto);
		int isOk = msv.cdCheck(mcDto); 
		return isOk == 1 ? "1" : "0";
	}
	
	
	
	
}
