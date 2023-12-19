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
	<link rel="stylesheet" href="/resources/css/rental/item_reserve.css">
</head>
<body>
	<jsp:include page="../common/nav.jsp" />
	
	<div class="bodyContainer">
		<div class="back">
			<div class="mainLogo">
				<img alt="" width="180" height="160" src="/resources/etc/logo_white.png">
			</div>

		<div class="rentalAndPay">
			<div class="rentalAndPayTitle">
				<h3>결제정보</h3>
				<div class="rentalAndPayTitleBox">
					<div class="conBox con-1">
						<i class="bi bi-cart-fill"></i>
						<p>BASKET</p>
					</div>
					<div class="conBox con-2">
						<i class="bi bi-coin"></i>
						<p>PAYMENT</p>
					</div>
					<div class="conBox con-3">
						<i class="bi bi-calendar-check"></i>
						<p>MAIN</p>
					</div>
				</div>
			</div>
			
			<div class="section-title">
				<h3 class="section-title1">선택 목록</h3>
				<h3 class="section-title2">총 금액 : ${sum }원 </h3>
			</div>
			
			<div class="rentalContainer">
				<c:forEach items="${rtiList }" var="rList">
				<div class="rentalItemBox">
					<div class="rentalImg">
						<img alt="" src="${rList.rentalItemUrl }">
					</div>
					<div class="rentalContent">
						<%-- <span>${rList.rentalItemNum }</span> --%>
						<p>${rList.rentalItemName }</p>
						<p>${rList.rentalItemPrice }원</p>	
					</div>
				</div>
				</c:forEach>
			</div>
			<div class="payContainer">
				<div class="payBox1">

					<div class="box">
						<div class="input-box">
							<input type="hidden" name="rentalReserveStart" id="rentalReserveStart" placeholder="렌탈이용날짜">
							<div class="date-group">
								<div class="input-group calendar">
				              	 	<div class="input-group-prepend">
				                		 <span class="input-group-text"><i class="bi bi-calendar"></i></span>
				                	</div>
									<input type="text" class="form-control" id="dateRangePicker" placeholder="날짜를 선택하세요" readonly="readonly">
									<button id="nextBtn" type="button" class="btn btn-light">다음</button>
								</div>
							</div>
						</div>	
					</div>

				</div>
				<div class="payBox2">
	
					<div class="pay-content">
				      <div class="pay-header">
				        <p class="payTitle">결제선택하기</p>
				      </div>
				      <div class="modal-body pay-info">
				      	<div>상품명<div class="pay-value" id="item-name"></div></div>
				      	<div>판매자  <div class="pay-value">다이스키</div></div>
				      	<div>등급<div class="pay-value" id="userGradeRate"></div></div>
					    <div class="pay3-box">결제금액<div class="pay-value" id="userViewpay"></div></div> 
				  
				      </div>
				      <div class="pay-method">
				            <button id="inicis_pay" onclick="paymentGateway('html5_inicis')" type="button"> <span>통합결제 </span></button>
				            <button id="kakao_pay"  onclick="paymentGateway('kakaopay.TC0ONETIME')" type="button"> <span>카카오</span> </button>            
				            <button id="toss_pay" onclick="paymentGateway('tosspay.tosstest')" type="button"> <span>토스페이 </span></button>           
				            <button id="payco_pay" onclick="paymentGateway('payco.AUTOPAY')" type="button"><span>페이코</span></button>
				            <button id="naver_pay" ><span>네이버페이</span></button>
				            <hr>
				            <button id="my_coupon_list" value="openWorld" type="button"> <span>쿠폰</span></button>
				            
							<div id="myCouponListBody" class="myCouponListBody">
								 <div class="myCouponListTitle">
								 	<span><i class="bi bi-envelope-paper-heart-fill"></i> 내 쿠폰함</span> 
								 </div>
								 <div class="myCouponList" id="myCouponList">
								 	
								 </div>
							</div>
							
				      </div>
				    </div>

				</div>
			
			</div>
		
		</div>
		
			
		
		</div>
		
	</div>
	
	

	<script type="text/javascript" src="/resources/js/rental/itemReserve.js"></script>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>