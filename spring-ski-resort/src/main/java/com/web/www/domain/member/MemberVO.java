package com.web.www.domain.member;

import java.util.List;

import com.web.www.security.AuthVO;

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
	private String memberId;	//아이디 , 소셜유저는 난수값이 들어옵니다.
	private String memberPwd;	//비번
	private String memberAlias;	//닉네임
	private String memberName;	//실명
	private String memberEmail;	//이메일
	private String memberAddress;	//주소
	private String memberAddressDetail;	//상세주소
	private String memberPhoneNum;	//폰번호
	private String memberTerms1; //이용약관
	private String memberTerms2; //이용약관
	private String memberTerms3; //이용약관
	private String memberType;	//일반회원 | 소셜회원
	private String memberGrade;	//회원등급 (결제기준)
	
	private String memberRegAt;	//회원가입날짜
	private String memberLastAt;	//마지막 로그인 날짜
	private String memberPwdModAt;	//마지막 비밀번호 변경 날짜
	
	private List<AuthVO> authList;	//여러개의 권한을 리스트로 관리
	
	
	
	
	
}
