package com.web.www.domain.member;

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
	
	@NotBlank(message = "별명을 입력해주세요.")
	private String memberAlias;
	
	@NotBlank(message = "이메일을 입력해주세요.")
	private String memberEmail;	//일반회원용
	
	@NotBlank(message = "핸드폰 번호를 입력해주세요.")
	private String memberPhoneNum;
	
	@NotBlank(message = "주소를 입력해주세요.")
	private String memberAddress;
	private String memberAddressDetail;
	
}
