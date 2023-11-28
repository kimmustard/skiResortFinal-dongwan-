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
  	<!-- GppgleFont -->
   	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Hahmlet&display=swap" rel="stylesheet">
   	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
	
	
	
	
	
	<jsp:include page="../common/nav.jsp"></jsp:include>
	<link rel="stylesheet" href="/resources/css/hotel/reservation.css">




<body>

	<div class="back">
		<img alt="" src="https://www.chamonix.com/sites/default/files/styles/full_screen/public/media/images/%C2%A9%20Daniel_Ronnback.webp?h=ea95bb15&itok=9owM8byS">
		<!-- <div class="selector">
			<div>
				<a href="/rental/reserve">스키/리프트권</a>
			</div>
			<div>
				<a href="">호텔예약</a>
			</div>
		</div> -->

		<div class="box">
			<form action="/hotel/reservation" method="post" id="form">
			<div id="box">
			<p class="fs-3 hotelText">호텔예약/<a class="move-rental" href="/rental/reserve">리프트권 예약</a></p>
			<div class="input-box">
			<!--실제 값을 저장하는 애들 화면에는 없음-->
			<input name="hotelReservePeople" id="hotelReservePeople" placeholder="성인인원" type="hidden">
			<input name="hotelReserveChild" id="hotelReserveChild" value="0" placeholder="어린이인원" type="hidden">
			<input name="hotelReserveStayStart" id="hotelReserveStayStart" placeholder="투숙시작일" type="hidden">
			<input name="hotelReserveStayEnd" id="hotelReserveStayEnd" placeholder="투숙종료일" type="hidden">
				
				<div class="date-group">
					<div class="input-group calendar">
              	 	<div class="input-group-prepend">
                		 <span class="input-group-text"><i class="bi bi-calendar"></i></span>
                	</div>
					<input type="text" class="form-control" id="dateRangePicker" placeholder="날짜를 선택하세요" readonly="readonly">
					</div>
				</div>
				<div class="input-group">
					<div class="input-group mb-3">
  						<span class="input-group-text" id="basic-addon1"><i class="bi bi-person-fill"></i></span>
  						<input type="text" id="people" class="form-control people" placeholder="인원수" aria-label="Username" readonly="readonly" aria-describedby="basic-addon1">
						<button id="payBtn" type="button" class=" btn btn-light">다음</button>
				</div>
					
  				<div class="peoplelist"  id="peoplelist" style="display: none;">
  					<div class="list-Btn-Box">
  						성인    
  						<div class="people-Btn"> 
	  						<div>
	  							<button type="button" id="adult-Btn">
	  								<svg style="width: 14px; height: 14px; xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M20.25 12.75H3.75a.75.75 0 0 1 0-1.5h16.5a.75.75 0 0 1 0 1.5z"></path></svg>
	  							</button>
	  						</div> 
	  						 
	  						<div id="audlt-Count">
	  							1
	  						</div> 
	  						
	  						<div>
	  							<button type="button" id="adult+Btn">
	  							<svg style="width: 14px; height: 14px; xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M20.25 11.25h-7.5v-7.5a.75.75 0 0 0-1.5 0v7.5h-7.5a.75.75 0 0 0 0 1.5h7.5v7.5a.75.75 0 0 0 1.5 0v-7.5h7.5a.75.75 0 0 0 0-1.5z"></path></svg>
	  							</button>
	  						</div> 
  						</div> 
  					</div>
  					
  					<div class="list-Btn-Box">
  						어린이
  						<div class="people-Btn"> 
	  						<div>
	  							<button type="button" id="child-Btn">
	  								<svg style="width: 14px; height: 14px; xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M20.25 12.75H3.75a.75.75 0 0 1 0-1.5h16.5a.75.75 0 0 1 0 1.5z"></path></svg>
	  							</button>
	  						</div> 
	  						 
	  						<div id="child-Count">
	  							0
	  						</div> 
	  						<div>
	  							<button type="button" id="child+Btn">
	  							<svg style="width: 14px; height: 14px; xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M20.25 11.25h-7.5v-7.5a.75.75 0 0 0-1.5 0v7.5h-7.5a.75.75 0 0 0 0 1.5h7.5v7.5a.75.75 0 0 0 1.5 0v-7.5h7.5a.75.75 0 0 0 0-1.5z"></path></svg>
	  							</button>
	  						</div> 
  						</div> 
  					</div>
  						<div>
  							<button id="peoplelistClose" type="button" class="btn btn-outline-primary">닫기</button>
  						</div>
  					<!-- 	<div id="chile-age">
  						</div> -->
  				</div>
			
  			</div>
  		</div>
		</div>		
				
				
				
			
				<div id="innerbox" style="display: none;">
					<!-- 방 추가는 여기 -->
					<input class="room-option" id="select1" type="radio" name="hotelRoomNum" value="1" >
					<input class="room-option" id="select2" type="radio" name="hotelRoomNum" value="2">
					<input class="room-option" id="select3" type="radio" name="hotelRoomNum" value="3">
					<input class="room-option" id="select4" type="radio" name="hotelRoomNum" value="4">
					<input class="room-option" id="select5" type="radio" name="hotelRoomNum" value="5">
					<input class="room-option" id="select6" type="radio" name="hotelRoomNum" value="6">
					<input class="room-option" id="select7" type="radio" name="hotelRoomNum" value="7">
					<input class="room-option" id="select8" type="radio" name="hotelRoomNum" value="8">
					<input class="room-option" id="select9" type="radio" name="hotelRoomNum" value="9">
					<input class="room-option"id="select10" type="radio" name="hotelRoomNum" value="10">
					<ul	class="room-selecor">
					<!-- 방 버튼은 여기 -->
						<li class="room-rank">일반객실</li>
						<li onclick="roomSelectEvent(1)" value="96000" id="room1">스탠다드 더블(2인)</li>
						<li onclick="roomSelectEvent(2)" value="96000" id="room2">스탠다드 트윈(2인)</li>
						<li onclick="roomSelectEvent(3)" value="132000" id="room3">스탠다드 온돌(3인)</li>
						<li onclick="roomSelectEvent(4)" value="132000" id="room4">스탠다드 더블온돌(4인)</li>
						<li onclick="roomSelectEvent(5)" value="132000" id="room5">마운틴 마운틴스위트(6인)</li>
						<li onclick="roomSelectEvent(6)" value="180000" id="room6">마운틴 패밀리 가든(8인)</li>
						<li class="room-rank">vip객실</li>
						<li onclick="roomSelectEvent(7)" value="96000" id="room7">vip 더블(2인)</li>
						<li onclick="roomSelectEvent(8)" value="96000" id="room8">vip 트윈(2인)</li>
						<li onclick="roomSelectEvent(9)" value="96000" id="room9">vip 온돌(3인)</li>
						<li onclick="roomSelectEvent(10)" value="96000" id="room10">vip 더블온돌(4인)</li>
					</ul>
					
					<div class="room-info-box">
						<div class="room-image-box">
							<div class="room-image" id="room-image"></div>
							<div class="room-name" id="room-name"></div>
						</div>
					<div class="paybox input-group mb-3">
						<input type="text" id="pay1" class="form-control" placeholder="요금" readonly="readonly">	
						<input type="hidden" id="pay2" class="form-control" name="hotelReserveFee" placeholder="요금">	
						<button type="button" class="btn btn-outline-secondary" id="submitBtn">결제</button>
					 </div>
					</div>
					
						<button id="closeBtn" type="button" class="btn btn-outline-secondary">이전</button>
				</div>
				
			</form>
			
			
			<!-- 방 이미지 링크는 여기 -->
			<p class="image-url" id="image-src1">
			https://img.freepik.com/free-photo/room-interior-of-hotel-bedroom_23-2150683421.jpg?size=626&ext=jpg&ga=GA1.1.1826414947.1699056000&semt=sph
			</p>
			<P class="image-url" id="image-src2">
			https://wehotel.co.kr/wp-content/uploads/sites/35/2023/07/WE-Hotel-Superior-Floor-MtSFM_1_m.jpg
			</P>
			<P class="image-url" id="image-src3">
			https://a.cdn-hotels.com/gdcs/production124/d84/90ca94f2-3c07-4732-8c5e-0c0ccba8e74d.jpg
			</P>
			<P class="image-url" id="image-src4">
			</P>
			<P class="image-url" id="image-src5">
			
			</P>
			<P class="image-url" id="image-src6">
			
			</P>
			<P class="image-url" id="image-src7">
			
			</P>
			<P class="image-url" id="image-src8">
			
			</P>
			<P class="image-url" id="image-src9">
			
			</P>
			<P class="image-url" id="image-src10">
			
			</P>
			
		
		</div>
	</div>






</body>
	<jsp:include page="../common/footer.jsp"></jsp:include>	
	<script defer type="text/javascript"
		src="/resources/js/hotel/reservation.js"></script>
</html>