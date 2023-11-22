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
   <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <!-- Bootstrap 4 JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <!-- Moment.js -->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/moment@2.29.1/locale/ko.js"></script> <!-- 한국어 locale 파일 추가 -->

    <!-- DateRangePicker CSS -->
   <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

    <!-- DateRangePicker JS -->
   <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
   
   
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
	
	
	
	
	
	<link rel="stylesheet" href="/resources/css/hotel/reservation.css">




<body>
	<jsp:include page="../common/nav.jsp"></jsp:include>

	<div class="back">
		<div class="selector">
			<div>
				<a href="#">스키/리프트권</a>
			</div>
			<div>
				<a href="">호텔예약</a>
			</div>
		</div>

		<div class="box">

			<form action="/hotel/reservation" method="post">
			<!--실제 값을 저장하는 애들 화면에는 없음-->
			<input name="hotelReservePeople" id="hotelReservePeople" placeholder="성인인원" >
			<input name="hotelReserveChild" id="hotelReserveChild" value="0" placeholder="어린이인원">
			<input name="hotelReserveStayStart" id="hotelReserveStayStart" placeholder="투숙시작일">
			<input name="hotelReserveStayEnd" id="hotelReserveStayEnd" placeholder="투숙종료일">
				
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
  				<div class="peoplelist"  id="peoplelist" style="display: none;">
  				
  					<div style="height: 25px">
  						성인    
  						<div class="people-Btn"> 
	  						<div>
	  							<button type="button" id="adult-Btn">-</button>
	  						</div> 
	  						 
	  						<span id="audlt-Count">
	  							1
	  						</span> 
	  						
	  						<div>
	  							<button type="button" id="adult+Btn">+</button>
	  						</div> 
  						</div> 
  					</div>
  					
  					<div style="height: 25px">
  						어린이
  						<div class="people-Btn"> 
	  						<div>
	  							<button type="button" id="child-Btn">-</button>
	  						</div> 
	  						 
	  						<span id="child-Count">
	  							0
	  						</span> 
	  						
	  						<div>
	  							<button type="button" id="child+Btn">+</button>
	  						</div> 
  						</div> 
  						
  						
  						<div id="chile-age">
  						</div>
  						
  					</div>
  				</div>
  				
				
				
				
				<button id="payBtn" type="button">다음</button>
				
			
				<div id="innerbox" style="display: none;">
			
					<input type="radio" name="hotelRoomNum" value="1">방1 <input
						type="radio" name="hotelRoomNum" value="2">방2 <input type="radio"
						name="hotelRoomNum" value="3">방3 <input type="radio" name="room"
						value="방">방 <input type="radio" name="hotelRoomNum" value="4">방4
					<input type="radio" name="hotelRoomNum" value="5">방5
					<button id="closeBtn" type="button">닫기</button>
					<input type="checkbox"> <input type="checkbox">
					<input type="text" name="hotelReserveFee" placeholder="요금">	
					<button type="submit">결제</button>
				</div>
			</form>

		</div>
	</div>





	<script defer type="text/javascript"
		src="/resources/js/hotel/reservation.js"></script>

</body>
</html>