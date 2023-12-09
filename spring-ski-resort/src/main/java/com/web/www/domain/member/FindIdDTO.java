package com.web.www.domain.member;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class FindIdDTO {

	@Email
	@NotBlank(message = "이메일을 입력해주세요.")
	private String memberEmail;
	@NotBlank(message = "이름을 입력해주세요.")
	private String memberName;
	@NotBlank(message = "아이디를 입력해주세요.")
	private String memberId;
	
}
