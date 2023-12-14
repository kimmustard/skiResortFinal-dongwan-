<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장비 렌탈 페이지</title>

	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
   <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
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
   	<!-- GppgleFont -->
   	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Hahmlet&display=swap" rel="stylesheet">


	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
	<link rel="stylesheet" href="/resources/css/coupon/coupon.css">
	<link rel="stylesheet" href="/resources/css/pay/pay_modal.css">
	<link rel="stylesheet" href="/resources/css/rental/item_reserve.css">
</head>
<body>
	<jsp:include page="../common/nav.jsp" />
	
	<div class="bodyContainer">
		
	
	
	
		<div class="back">
			<img data-v-c62ee4ac="" src="https://cdn.shymbulak-dev.com/media-test/77032ae86d50f5d61c9cec8b2f30ae39.jpg" alt="" style="width: 100%; height: 100vh;">
			
			<div class="box">
				<p class="fs-3  rentalText">장비렌탈</p>
				<form action="/rental/item-reserve" method="post" id="payform">
					<div class="input-box">
						<input type="hidden" name="rentalReserveStart" id="rentalReserveStart" placeholder="렌탈이용날짜">
						<input name="rentalReserveAdult" id="rentalReserveAdult" value="0" placeholder="성인인원" type="hidden">
						<input name="rentalReserveKid" id="rentalReserveKid" value="0" placeholder="어린이인원" type="hidden">
						
						<div class="date-group">
							<div class="input-group calendar">
			              	 	<div class="input-group-prepend">
			                		 <span class="input-group-text"><i class="bi bi-calendar"></i></span>
			                	</div>
								<input type="text" class="form-control" id="dateRangePicker" placeholder="날짜를 선택하세요" readonly="readonly">
							</div>
						</div>
						<div class="input-box1">
							<div class="input-group mb-3">
								<span class="input-group-text" id="basic-addon1"><i class="bi bi-person-fill"></i></span>
								<input type="text" id="people" class="form-control people" placeholder="인원수" aria-label="Username" readonly="readonly" aria-describedby="basic-addon1">
								<button id="nextBtn" type="button" class="btn btn-light">다음</button>
							</div>
							<div class="peopleList"  id="peopleList" style="display: none;">
			  					<div class="list-Btn-Box">
			  						성인    
			  						<div class="people-Btn"> 
				  						<div>
				  							<button type="button" id="adult-Btn">
				  								<svg style="width: 14px; height: 14px; xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M20.25 12.75H3.75a.75.75 0 0 1 0-1.5h16.5a.75.75 0 0 1 0 1.5z"></path></svg>
				  							</button>
				  						</div> 	 
				  						<div id="adult-Count">
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
		  					
		  					</div>
						</div>	
					</div>
					
					
					
					<div id="innerbox" class="reserveBox" style="display: none;">
						
						
						<div class="input-group mb-3">
							<span class="input-group-text">렌탈장비명</span>
							<input type="text" class="form-control" id="showItemName" value="" readonly="readonly">
						</div>
						<div class="input-group mb-3">
							<span class="input-group-text">요금(성인)</span>
							<input type="text" class="form-control" id="showAdultFee" value="0" readonly="readonly">
						</div>
						<div class="input-group mb-3">
							<span class="input-group-text">요금(어린이)</span>
							<input type="text" class="form-control" id="showKidFee" value="0" readonly="readonly">
						</div>
						
						<div class="input-group mb-3">
							<span class="input-group-text">총요금</span>
							<input type="text" class="form-control" id="showTotalFee" value="0" readonly="readonly">
						</div>
						<p class="fs-4">반납서비스 신청</p>
						<div class="form-check">
						  <input class="form-check-input" type="radio" name="rentalLiftTicket" value="Y" id="morningTicket">예
						</div>
						<div class="form-check">
						  <input class="form-check-input" type="radio" name="rentalLiftTicket" value="N" id="afternoonTicket">아니오
						</div>
						<!-- db로 보낼 hidden input  -->
						
							
	
						<a href="/rental/item-reserve"><button type="button" class="btn btn-outline-primary">이전으로</button></a>
						<button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#hotel-pay">결제</button>
					</div>
				</form>
			</div>
		
		</div>
		
	</div>
	
	
	
	<script type="text/javascript" src="/resources/js/rental/item.js"></script>
	<script type="text/javascript" src="/resources/js/rental/itemReserve.js"></script>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>