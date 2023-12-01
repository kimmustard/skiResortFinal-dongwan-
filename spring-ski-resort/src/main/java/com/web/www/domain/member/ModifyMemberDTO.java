package com.web.www.domain.member;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ModifyMemberDTO {
	
	private String memberId;	//회원 검증을 위한 키값
	private String memberType;	//회원 검증을 위한 타입
	
	@NotBlank
	private String memberAlias;
	
	@NotBlank
	@Email
	private String memberEmail;	//일반회원용
	
	@NotBlank
	private String memberPhoneNum;
	
	@NotBlank
	private String memberAddress;
	private String memberAddressDetail;
	
}
