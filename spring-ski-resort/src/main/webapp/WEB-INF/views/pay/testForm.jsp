<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="/pay/order" method="post">
	<button type="submit" id="btn-kakao-pay"> 결제하기 </button>

</form>


<button id="check_module"> 다른결제 </button>

<button onclick="requestPay()">또 다른 결제하기</button>

 <script type="text/javascript" src="/resources/js/pay/pay.js"></script>
</body>
</html>