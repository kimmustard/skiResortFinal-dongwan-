<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장비 렌탈 페이지</title>
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

<link rel="stylesheet" href="/resources/css/rental/item_reserve.css">
</head>
<body>
	<jsp:include page="../common/nav.jsp" />
	
	<div class="bodyContainer">
	
		<div class="reserveContainer">
			<img data-v-c62ee4ac="" src="https://cdn.shymbulak-dev.com/media-test/77032ae86d50f5d61c9cec8b2f30ae39.jpg" alt="" style="width: 100%; height: 100vh;">
			
			<div class="box">
				<form action="/rental/item-reserve">
					<div class="input-box">
						<input type="hidden" name="rentalReserveStart" id="rentalReserveStart" placeholder="렌탈이용날짜">
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
						<div id="innerbox">
						<div class="peo">
							<div class="input-group mb-3">
								<span class="input-group-text">인원수(성인)</span>
								<input type="text" class="form-control" name="rentalReserveAdult" id="rentalReserveAdult" readonly="readonly">
							</div>
							<div class="input-group mb-3">
								<span class="input-group-text">인원수(어린이)</span>
								<input type="text" class="form-control" name="rentalReserveKid" id="rentalReserveKid" readonly="readonly">
							</div>
						</div>
						<div class="input-group mb-3">
							<span class="input-group-text">상품명</span>
							<input type="text" class="form-control" name="rentalReserveItem" id="rentalReserveItem" readonly="readonly">
						</div>
						<div class="fee">
							<div class="input-group mb-3">
								<span class="input-group-text">성인요금</span>
								<input type="text" class="form-control" name="rentalReserveAdultFee" id="rentalReserveAdultFee" readonly="readonly">
							</div>
							<div class="input-group mb-3">
								<span class="input-group-text">어린이요금</span>
								<input type="text" class="form-control" name="rentalReserveKidFee" id="rentalReserveKidFee" readonly="readonly">
							</div>
						</div>
						<div class="input-group mb-3">
							<span class="input-group-text">총 요금</span>
							<input type="text" class="form-control" name="rentalReserveTotalFee" id="rentalReserveTotalFee" readonly="readonly">
						</div>
						<div class="input-group mb-3">
							<label class="form-check-label" for="flexRadioDefault2">반납서비스 이용</label>
						</div>
						<div class="form-check">
						  	<input class="form-check-input" type="radio" name="rentalReserveIsreturn" id="yesCheck" value="Y">
						  	<label class="form-check-label" for="flexRadioDefault1">
						    예
						  	</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="rentalReserveIsreturn" id="noCheck" value="N">
							<label class="form-check-label" for="flexRadioDefault1">
							아니오
							</label>
						</div>
					</div>
					</div>
					<a href="/rental/ski-item"><button type="button" class="btn btn-outline-primary">이전으로</button></a>
					<button type="submit" class="btn btn-outline-primary">결제</button>
				</form>
			</div>
		</div>
	
	</div>
	
	
	
	<script type="text/javascript" src="/resources/js/rental/item.js"></script>
	<script type="text/javascript" src="/resources/js/rental/itemReserve.js"></script>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>