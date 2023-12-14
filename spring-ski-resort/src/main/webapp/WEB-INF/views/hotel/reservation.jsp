<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 결제 하기위해 imp 받아오기-->
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
   <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
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
	<link rel="stylesheet" href="/resources/css/coupon/coupon.css">
	<link rel="stylesheet" href="/resources/css/pay/pay_modal.css">




<body>



	
<!-- Modal -->

			
<div class="modal fade" id="hotel-pay" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content ">
      <div class="modal-header">
      	
        <h1 class="modal-title fs-5" id="staticBackdropLabel">결제선택하기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body pay-info">
      	<div>상품명<div class="pay-value" id="item-name"></div></div>
      	<div>판매자  <div class="pay-value">다이스키</div></div>
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
		<form action="/hotel/reservation" method="post" id="payform">
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
  						<input type="text" id="people" class="form-control people"  placeholder="인원수" aria-label="Username" readonly="readonly" aria-describedby="basic-addon1">
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
					<c:forEach items="${roomList }" var="room">
					<c:if test="${room.hotelRoomCount >= 0 }">
					<input class="room-option" id="select${room.hotelRoomNum}" type="radio" name="hotelRoomNum" value="${room.hotelRoomNum }" >
					</c:if>
					</c:forEach>
					<ul	class="room-selecor">
					<!-- 방 버튼은 여기 -->
			
						<li class="room-rank">일반객실</li>
					<c:forEach items="${roomList }" var="room">
						<c:if test="${room.hotelRoomType eq 'nomal' && room.hotelRoomCount >= 0}">
						
						<li onclick="roomSelectEvent(${room.hotelRoomNum})" value="${room.hotelRoomFee }" id="room${room.hotelRoomNum}">${room.hotelRoomName }(${room.hotelRoomStandardPeople}인)</li>	
					</c:if >
				</c:forEach>
			
				
			
						<li class="room-rank">vip객실</li>
					<c:forEach items="${roomList }" var="room" >
						<c:if test="${room.hotelRoomType eq 'vip' && room.hotelRoomCount >= 0}">
						<li onclick="roomSelectEvent(${room.hotelRoomNum})" value="${room.hotelRoomFee }" id="room${room.hotelRoomNum}">${room.hotelRoomName }(${room.hotelRoomStandardPeople}인)</li>
				
					</c:if> 
					</c:forEach>
					</ul>
					
					
					<div class="room-info-box">
						<div class="room-image-box">
							<div class="room-image" id="room-image"></div>
							<div class="room-name" id="room-name"></div>
							<div class="room-explain" id="room-explain"></div>
							<input type="hidden" id="room-payinfo-num" value="">
								
						</div>
					<div class="paybox input-group mb-3">
						<input type="text" id="pay1" class="form-control" placeholder="요금" readonly="readonly">	
						<input type="hidden" id="realpayvalue" class="form-control" name="hotelReserveFee" placeholder="요금">	
						<input type="hidden" name="memberNum" placeholder="회원번호" value="${mvo.memberNum }">	
						<input type="hidden" name="payImpUid" id="payImpUid">	
						<input type="hidden" name="payMerchantUid" id="payMerchantUid">	
						<input type="hidden" name="payAmount" id="payAmount">	
						<input type="hidden" name="payName" id="payName">	
						<input type="hidden" id="name-type" value="호텔">	
						<input type="hidden" id="productPrice">	
						<input type="hidden" name="couponCode" id="couponCode" >
						<button type="button" class="btn btn-outline-secondary" id="modal-btn"  data-bs-toggle="modal" data-bs-target="#hotel-pay" style="display: none">결제</button>
						<button type="button" class="btn btn-outline-secondary"  id="submitBtn">결제</button>
					 </div>
					</div>
						<button id="closeBtn" type="button" class="btn btn-outline-secondary">이전</button>
				</div>
				

			
			
			<!-- 방 이미지 링크는 여기 -->
			<c:forEach items="${roomList}" var="room">
			<p class="hidden-info" id="image-src${room.hotelRoomNum}">
				${room.hotelImage}
			</p>
		
		
			
			</c:forEach>
		
			
	</form>
		
		</div>
	</div>





</body>
	<jsp:include page="../common/footer.jsp"></jsp:include>	
	<script type="text/javascript">
	const memberEmail= `<c:out value="${mvo.memberEmail}"/>`;
	const memberName= `<c:out value="${mvo.memberName}"/>`;
	const memberPhoneNum= `<c:out value="${mvo.memberPhoneNum}"/>`;
	const memberAddress= `<c:out value="${mvo.memberAddress}"/>`;
	let realAmount = 0;

	</script>
	<script type="text/javascript" src="/resources/js/pay/pay.js"></script>
	<script type="text/javascript" src="/resources/js/coupon/coupon.js"></script>
	<script type="text/javascript" src="/resources/js/hotel/reservation.js"></script>
	
</html>