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
	<div class="mainContainer">
		<div class="successContainer">
			<div class="successBox success-Box1">
				<img alt="" width="270" height="220" src="/resources/etc/logo_detail.png">
			</div>
			<div class="successBox success-Box2">
				<img alt="" width="350" height="120" src="/resources/etc/ThankYou.png">
			</div>
			<div class="successBox success-Box3">
				<p>주문번호 : ${prDTO.payMerchantUid}</p>
				<p>결제금액 : ${prDTO.payAmount}원</p>
				<p>구매상품 : ${prDTO.payName}</p>		
			</div>
			<div class="succress-Btn">
				<a href="/"><button class="btn btn-primary btn-1" style="background-color: rgb(39,48,77);">메인으로</button></a>
				<a href="/pay/memberPayList"><button class="btn btn-primary btn-2" style="background-color: rgb(39,48,77);">구매내역</button></a>
			</div>
		</div>
	</div>
</body>
</html>