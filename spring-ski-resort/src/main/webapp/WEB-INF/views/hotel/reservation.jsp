<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

  <!-- Bootstrap 4 CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

    <!-- Bootstrap 4 JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <!-- Moment.js -->
    <script src="https://cdn.jsdelivr.net/npm/moment@2.29.1/moment.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/moment@2.29.1/locale/ko.js"></script> <!-- 한국어 locale 파일 추가 -->

    <!-- DateRangePicker CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/daterangepicker@3.1.0/daterangepicker.css" />

    <!-- DateRangePicker JS -->
    <script src="https://cdn.jsdelivr.net/npm/daterangepicker@3.1.0/daterangepicker.min.js"></script>

	
<link rel="stylesheet" href="/resources/css/hotel/reservation.css">




<body>
	<jsp:include page="../common/nav.jsp"></jsp:include>

	<div class="back">
		<div class="selector">
			<div>
				<a href="/rental/reserve">스키/리프트권</a>
			</div>
			<div>
				<a href="">호텔예약</a>
			</div>
		</div>

		<div class="box">

			<form action="">
				<div class="container mt-3">
					<label for="dateRangePicker">날짜를 선택하세요:</label> <input type="text"
						class="form-control" id="dateRangePicker">
				</div>

				<div id="result1" class="container mt-3"></div>
				
				<div class="people">인원수</div>
				<button id="payBtn" type="button">다음</button>
				<div id="innerbox" style="display: none;">
					<input type="radio" name="room" value="방">방 <input
						type="radio" name="room" value="방">방 <input type="radio"
						name="room" value="방">방 <input type="radio" name="room"
						value="방">방 <input type="radio" name="room" value="방">방
					<input type="radio" name="room" value="방">방
					<button id="closeBtn">닫기</button>
					<input type="checkbox"> <input type="checkbox">
					<button type="submit">결제</button>
				</div>
			</form>

		</div>
	</div>





	<script defer type="text/javascript"
		src="/resources/js/hotel/reservation.js"></script>

</body>
</html>