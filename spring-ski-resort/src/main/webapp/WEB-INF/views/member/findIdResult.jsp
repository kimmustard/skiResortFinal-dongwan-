<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link  href="/resources/css/member/findId.css" rel="stylesheet">
<style type="text/css">

	.findBoxContainer{
		height: 300px;
	}
</style>
</head>
<body>
	<jsp:include page="../common/nav.jsp"></jsp:include>

	<div class="bodyContainer">
		<video width="100%" height="auto" autoplay loop muted>
		<source src="https://www.chamonix.com/sites/default/files/media/videos/homepage-servoz%201.mp4" type="video/mp4">
		</video>
	
	<div class="findMainBody">
		<div class="findMenu">
			<a id="find-id-menu" href="/member/findId">아이디찾기</a>
			<a id="find-pwd-menu" href="/member/findPwd">비밀번호찾기</a>
		</div>
		
		<form action="/member/findId" method="post">
		<div class="findBoxContainer">
			<img alt="" width="180" height="160" src="/resources/etc/logo_black.png">
			<div class="findBox find-email-box result-text">
				회원님의 아이디는 <font color="red" style="font-weight:bold;">${memberId} </font>입니다.
			</div>
		</div>
		</form>

	</div>
	
	
	
	</div>
	
	
	
	<script type="text/javascript" src="/resources/js/find/find.js"></script>
</body>
</html>