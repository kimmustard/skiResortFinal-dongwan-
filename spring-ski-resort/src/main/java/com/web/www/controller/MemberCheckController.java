package com.web.www.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.web.www.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/member/check/*")
@RequiredArgsConstructor
public class MemberCheckController {

	private final MemberService msv;
	
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
	
	
}
