<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 페이지</title>
<style type="text/css">
	
	.peopleList{
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
	
	<link rel="stylesheet" href="/resources/css/rental/reserve.css">

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
			<h1>리프트권 예약</h1>
			<form action="/rental/reserve" method="post">
				<input name="rentalLiftStart" id="rentalLiftStart" placeholder="렌탈이용날짜">
			
				<div class="date-group">
					<div class="input-group calendar">
	              	 	<div class="input-group-prepend">
	                		 <span class="input-group-text"><i class="bi bi-calendar"></i></span>
	                	</div>
						<input type="text" class="form-control" id="dateRangePicker" placeholder="날짜를 선택하세요" readonly="readonly">
					</div>
					<div class="input-group mb-3">
  						<span class="input-group-text" id="basic-addon1"><i class="bi bi-person-fill"></i></span>
  						<input type="text" id="people" class="form-control people" placeholder="인원수" aria-label="Username" readonly="readonly" aria-describedby="basic-addon1">
					</div>
				</div>
					
				<div class="peopleList" id="peopleList" style="display: none;">
					<label for="adult">성인:</label>
					<div class="input-group">
				        <button id="adultDecrementBtn" class="btn btn-outline-primary" type="button">-</button>
				        <input type="text" class="form-control" id="adultPeople" name="rentalLiftAdult" value="0" readonly="readonly">
				        <button id="adultIncrementBtn" class="btn btn-outline-primary" type="button">+</button>
    				</div>
					<label for="kid">어린이:</label>
					<div class="input-group">
				        <button id="kidDecrementBtn" class="btn btn-outline-primary" type="button">-</button>
				        <input type="text" class="form-control" id="kidPeople" name="rentalLiftKid" value="0" readonly="readonly">
				        <button id="kidIncrementBtn" class="btn btn-outline-primary" type="button">+</button>
    				</div>
				</div>
				<button id="nextBtn" type="button" class="btn btn-outline-primary">다음</button>
				
				<div id="innerbox" class="reserveBox" style="display: none;">
					<div class="input-group mb-3">
						<span class="input-group-text">리프트권 선택</span>
					</div>
					<div class="form-check">
					  <input class="form-check-input" type="radio" name="rentalLiftTicket" id="morningTicket">오전권
					</div>
					<div class="form-check">
					  <input class="form-check-input" type="radio" name="rentalLiftTicket" id="afternoonTicket">오후권
					</div>
					<div class="form-check">
					  <input class="form-check-input" type="radio" name="rentalLiftTicket" id="dayTimeTicket">주간권
					</div>
					<div class="form-check">
					  <input class="form-check-input" type="radio" name="rentalLiftTicket" id="nightTimeTicket">야간권
					</div>
					<div class="form-check">
					  <input class="form-check-input" type="radio" name="rentalLiftTicket" id="allDayTicket">종일권
					</div>
					<div class="form-check">
					  <input class="form-check-input" type="radio" name="rentalLiftTicket" id="seasonTicket">시즌권
					</div>
					
					<div class="input-group mb-3">
						<span class="input-group-text">요금(성인)</span>
						<input type="text" class="form-control" name="rentalLiftAdultFee" value="0" readonly="readonly">
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text">요금(어린이)</span>
						<input type="text" class="form-control" name="rentalLiftKidFee" value="0" readonly="readonly">
					</div>
					
					<a href="/rental/reserve"><button type="button" class="btn btn-outline-primary">이전으로</button></a>
					<button type="submit" class="btn btn-outline-primary">결제</button>
				</div>
				
			</form>
		</div>
	
	</div>
	
	
	<script type="text/javascript" src="/resources/js/rental/reserve.js"></script>

	
</body>
</html>