<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="stylesheet" href="/resources/css/rental/item_list.css">
</head>
<body>
	<jsp:include page="../common/nav.jsp" />
	<div class="bodyContainer">
	
		<div class="itemMenuContainer">
			<ul class="nav nav-tabs justify-content-center">
			  <li class="nav-item" id="skiItem">
			    <a class="nav-link" href="/rental/ski-item">스키</a>
			  </li>
			  <li class="nav-item" id="boardItem">
			    <a class="nav-link" href="/rental/board-item">스노우보드</a>
			  </li>
			  <li class="nav-item" id="wearItem">
			    <a class="nav-link" href="/rental/wear-item">의류/보호장비</a>
			  </li>  
			</ul>
		</div>
		
		<div class="menuCategory">
			<div>
				<nav class="nav flex-column nav-tabs">
				  <a class="nav-link" id="lowItem" href="#">일반장비SET</a>
				  <a class="nav-link" id="midItem" href="#">중급장비SET</a>
				  <a class="nav-link" id="premiumItem" href="#">프리미엄장비SET</a>
				</nav>
			</div>
		</div>
		
		<div class="itemContainer">
			<div class="boardItemList" id="boardItemList">
				
				<div class="itemInfo">	
					<div class="itemImageBox" id="lowItemImageBox">
						<c:forEach items="${boardLowItem }" var="lowItem">
							<div class="slide">
								<!-- 이미지파일 -->
								<img alt="BoardLowItem" data-name="${lowItem.rentalListLowItem }" src="${lowItem.imageUrl }">
							</div>
						</c:forEach>
					</div>
					
					
					
					
					<div class="itemImageBox" id="midItemImageBox" style="display: none;">
						
						<c:forEach items="${boardMidItem }" var="midItem">
							<div class="slide">
								<!-- 이미지파일 -->
								<img alt="BoardMidItem" data-name="${midItem.rentalListMidItem }" src="${midItem.imageUrl }">
							</div>
						</c:forEach>
						
					</div>
					
					
					
					
		
					<div class="itemImageBox" id="premiumItemImageBox" style="display: none;">
						
						<c:forEach items="${boardPremiumItem }" var="premiumItem">
							<div class="slide">
								<!-- 이미지파일 -->
								<img alt="BoardPremiumItem" data-name="${premiumItem.rentalListPremiumItem }" src="${premiumItem.imageUrl }">
							</div>
						</c:forEach>
						
					</div>
					
					<div class="slide-btn">
						<i class="bi bi-arrow-left-circle-fill slidePrevBtn" id="slidePrevBtn"></i>
						<i class="bi bi-arrow-right-circle-fill slideNextBtn" id="slideNextBtn"></i>
					</div>
					
					
					
	
				</div>
				
			</div>
		</div>
		
		<div class="shopContainer" style="display: none;">
			<div class="shoppingBasket">
				<p class="fs-4">장바구니</p>
				<a href="/rental/item-reserve"><button type="button" class="btn btn-outline-info reserveBtn">예약신청하기</button></a>
			</div>
		</div>

	</div>
	
	
	<script type="text/javascript" src="/resources/js/rental/item.js"></script>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>