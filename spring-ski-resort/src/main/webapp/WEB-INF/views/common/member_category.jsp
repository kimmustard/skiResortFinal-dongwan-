<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
   <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



	<div class="category-profile">
		<img alt="그림없음" width="230" height="200" src="/resources/etc/logo_white.png">
		<span>회원님의 등급은 <span id="member-grade">${mvo.memberGrade} </span> 입니다.</span>
	</div>
	<div class="category-body">
		<div class="category-Box1">
			<div class="category cbox1">
				<a href="/member/detail"> 
					<i class="bi bi-person-bounding-box"></i>
					<span class="category-span cs1">
						 내 프로필
					</span> 
				</a>
			</div>
			<div class="category cbox2">
				<a href="/member/memberPwd"> 
						<i class="bi bi-key-fill"></i>
					<span class="category-span cs2">
					 	비밀번호 변경
					</span> 
				</a>
			</div>
			<div class="category cbox3">
				<a href="/pay/memberPayList"> 
						<i class="bi bi-cash-coin"></i>
					<span class="category-span">
						 결제내역
					</span> 
				</a>
			</div>
			<div class="category cbox4">
				<a href="/member/memberQna"> 
						<i class="bi bi-chat-right-text-fill"></i>
					<span class="category-span">
						 문의내역
					</span> 
				</a>
			</div>
			<div class="category cbox6">
				<a href="/member/logoutSub"> 
						<i class="bi bi-box-arrow-left"></i> 
					<span class="category-span">
						로그아웃
					</span> 
				</a>
			</div>
			<div class="category cbox7">
				<a href="/alarm/memberAlarmList"> 
					<i class="bi bi-mailbox2"></i>
					<span class="category-span">
						 서비스알림
					</span> 
				</a>
			</div>
		</div>
		
		<div class="category-Box2">
			<div class="category cbox8">
				<div class="form-check form-switch">
			        <input class="form-check-input" type="checkbox" 
			        	id="flexSwitchCheckDefault" ${mvo.memberTerms3 eq 'terms3check' ? 'checked' : ''} value="${mvo.memberId }">
			        <label class="form-check-label" for="flexSwitchCheckDefault">광고성/마케팅 동의(선택)</label>
			    </div>
			</div>
			<div class="category cbox9">
				<div><span>가입일 </span>${mvo.memberRegAt }</div>
			</div>
			<div class="category cbox10">
				<div><span>마지막 로그인 </span>${mvo.memberLastAt }</div>
			</div>
			<div class="category cbox11">
				<div><span>비밀번호 변경일 </span>${mvo.memberPwdModAt }</div>
			</div>
		</div>
	</div>
</body>
</html>