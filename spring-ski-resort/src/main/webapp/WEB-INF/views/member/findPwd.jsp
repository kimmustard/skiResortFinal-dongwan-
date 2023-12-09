<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link  href="/resources/css/member/findPwd.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../common/nav.jsp"></jsp:include>
	
	<div class="bodyContainer">
		<video width="100%" height="auto" autoplay loop muted>
		<source src="https://www.chamonix.com/sites/default/files/media/videos/homepage-chamonix%201_0.mp4" type="video/mp4">
		</video>
		
		
		<div class="findMainBody">
		<div class="findMenu">
			<a id="find-id-menu" href="/member/findId">아이디찾기</a>
			<a id="find-pwd-menu" href="/member/findPwd">비밀번호찾기</a>
		</div>
		
		<div class="findBoxContainer">
			<img alt="" width="180" height="160" src="/resources/etc/logo_basic.png">
			<div class="findBox find-id-box">
				<label for="findId-id-input">아이디</label>
				<input type="text" id="findId-id-input" name="memberId" placeholder="아이디를 입력해주세요.">
			</div>
			<div class="findBox find-email-box">
				<label for="findId-email-input">이메일</label>
				<input type="text" id="findId-email-input" name="memberEmail" placeholder="이메일을 입력해주세요.">
			</div>
			
			<div class="findBox find-btn-box">
				<button class="btnBox" id="id-btn" type="submit">비밀번호찾기</button>
				<a href="/"><button class="btnBox" id="main-btn" type="button">메인으로</button></a> 
			</div>
		</div>
	
	
	</div>
	</div>
</body>
</html>