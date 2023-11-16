package com.web.www.domain;

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
	private int memberBirth;	//생일
	private String memberAddress;	//주소
	private String memberAddressDetail;	//상세주소
	private String memberPhoneNum;	//폰번호
	private String memberRegAt;	//회원등록일
	private int memberDel;	//회원탈퇴일자
	
	private String memberLastAt;	//로그아웃시간
	private String memberPwdModAt;	//비밀번호 변경일	
	
	
	
}
