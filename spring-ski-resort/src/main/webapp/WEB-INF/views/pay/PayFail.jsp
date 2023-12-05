<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link  href="/resources/css/pay/pay_success_and_fail.css" rel="stylesheet">
</head>
<body>
	<div class="mainContainer2">
		<div class="successContainer">
			<div class="successBox success-Box1">
				<img alt="" width="270" height="220" src="/resources/etc/logo_black.png">
			</div>
			<div class="successBox success-Box5">
				<img alt="" width="100" height="100" src="/resources/etc/fail.png">
			</div>
			<div class="successBox success-Box6">
				<p>결제실패</p>
				<p>실패 사유 : ${errorMessage}</p>
			</div>
			<div class="succress-Btn">
				<a href="/"><button class="btn btn-primary btn-3" style="background-color: black;">메인으로</button></a>
				<a href="/hotel/reservation"><button class="btn btn-primary btn-4" style="background-color: black;">결제 다시하기</button></a>
			</div>
		</div>
	</div>
</body>
</html>