package com.web.www.domain.member;

import javax.validation.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class MemberPwdDTO {
	
	@NotBlank(message = "비밀번호를 정확히 입력해주세요.")
	private String exPwd;
	
	@NotBlank(message = "비밀번호를 정확히 입력해주세요.")
	private String changePwd;
	
	@NotBlank(message = "비밀번호를 정확히 입력해주세요.")
	private String changePwdCheck;
}
