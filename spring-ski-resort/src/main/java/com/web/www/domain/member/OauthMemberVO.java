package com.web.www.domain.member;

import java.util.List;

import com.web.www.security.AuthVO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class OauthMemberVO {
	
	private long memberNum;	
	private String memberId;	//소셜 회원아이디는 난수로 들어갑니다.
	private String memberName;
	private String memberAlias;
	private String memberEmail;
	private String memberPhoneNum;
	
	private List<AuthVO> authList;	
	
}
