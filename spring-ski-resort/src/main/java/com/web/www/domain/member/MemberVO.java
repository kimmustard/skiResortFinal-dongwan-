package com.web.www.domain.member;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class MemberVO {

	
	private long memberNum;	//회원번호
	private String memberId;	//아이디
	private String memberPwd;	//비번
	private String memberAlias;	//닉네임
	private String memberName;	//실명
	private String memberEmail;	//이메일
	private String memberBirth;	//생일
	private String memberAddress;	//주소
	private String memberAddressDetail;	//상세주소
	private String memberPhoneNum;	//폰번호
	private String memberTerms1; //이용약관
	private String memberTerms2; //이용약관
	private String memberTerms3; //이용약관
	
	
}
