<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 페이지</title>
<style type="text/css">
	
	.peopleNum{
		width: 120px;
		
	}
</style>
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

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
	
<link rel="stylesheet" href="/resources/css/hotel/reservation.css">

<body>
	<jsp:include page="../common/nav.jsp" />
	
	<div class="back">

		<div class="selector">
			<div>
				<a href="">스키/리프트권</a>
			</div>
			<div>
				<a href="/hotel/reservation">호텔예약</a>
			</div>
		</div>
		
		<div class="box">
			<h1>장비렌탈/리프트권 예약</h1>
			<form action="/rental/reserve" method="post">
				<input name="rentalReserveStart" id="rentalReserveStart" placeholder="렌탈이용날짜">
			
				<div class="date-group">
					<div class="input-group calendar">
	              	 	<div class="input-group-prepend">
	                		 <span class="input-group-text"><i class="bi bi-calendar"></i></span>
	                	</div>
						<input type="text" class="form-control" id="dateRangePicker" placeholder="날짜를 선택하세요" readonly="readonly">
					</div>
				</div>
					
				<div class="peopleNum">
					<label for="numberOfPeople">인원수:</label>
					<div class="input-group">
				        <button id="decrementBtn" class="btn btn-outline-primary" type="button">-</button>
				        <input type="text" class="form-control" id="numberOfPeople" name="numberOfPeople" value="1" readonly>
				        <button id="incrementBtn" class="btn btn-outline-primary" type="button">+</button>
    				</div>
				</div>
				<button id="payBtn" type="button" class="btn btn-outline-primary">다음</button>
				
				<div id="innerbox" style="display: none;">
					<div class="input-group mb-3">
						<span class="input-group-text">이름</span>
						<input type="text" class="form-control" name="memberName">
					</div>
					<div>
						<select class="form-select">
						  <option selected>리프트권 선택</option>
						  <option value="lift1">리프트 오전권</option>
						  <option value="lift2">리프트 오후권</option>
						  <option value="lift3">리프트 주간권</option>
						  <option value="lift4">리프트 야간권</option>
						  <option value="lift5">리프트 종일권</option>
						  <option value="lift6">리프트 시즌권</option>
						  <option value="liftX">선택안함</option>
						</select>
					</div>
					<div>
						<select class="form-select">
						  <option selected>시간 선택</option>
						  <option value="rental1">렌탈 오전권</option>
						  <option value="rental2">렌탈 오후권</option>
						  <option value="rental3">렌탈 주간권</option>
						  <option value="rental4">렌탈 야간권</option>
						  <option value="rental5">렌탈 종일권</option>
						  <option value="rental6">렌탈 시즌권</option>
						  <option value="rentalX">선택안함</option>
						</select>
					</div>
					<div>
						<select class="form-select">
						  <option selected>장비 선택</option>
						  <option value="item1">일반장비SET</option>
						  <option value="item2">중급장비SET</option>
						  <option value="item3">프리미엄장비SET</option>
						</select>
					</div>
					
					<a href="/rental/reserve"><button type="button" class="btn btn-outline-primary">이전으로</button></a>
					<button type="button" id="closeBtn" class="btn btn-outline-primary">닫기</button>
					<button type="submit" class="btn btn-outline-primary">결제</button>
				</div>
				
			</form>
		</div>
	
	</div>
	
	
	<script type="text/javascript" src="/resources/js/rental/reserve.js"></script>
	
	<script defer type="text/javascript"
		src="/resources/js/hotel/reservation.js"></script>
	
</body>
</html>