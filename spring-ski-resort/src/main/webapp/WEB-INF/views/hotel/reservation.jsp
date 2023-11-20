<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="/resources/css/hotel/reservation.css">
<body>
	<jsp:include page="../common/nav.jsp"></jsp:include>
	
	<div class="back">
		<div class="selector">
			<div>
				<a href="">스키/리프트권</a>
			</div>
			<div>
				<a href="">호텔예약</a>
			</div>
		</div>

		<div class="box">
			<div class="calendar">달력</div>
			<div class="people">인원수</div>
			<button id="payBtn">다음</button>
			<div id="innerbox"></div>
		</div>
	</div>




<script defer type="text/javascript" src="/resources/js/hotel/reservation.js" ></script>
</body>
</html>