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
				  <a class="nav-link" id="lowItem" href="#">일반장비</a>
				  <a class="nav-link" id="midItem" href="#">중급장비</a>
				  <a class="nav-link" id="premiumItem" href="#">프리미엄장비</a>
				</nav>
			</div>
		</div>
		
		<div class="itemContainer">
			<div class="wearItemList" id="wearItemList">
				
				<div class="itemInfo">	
					<div class="itemImageBox" id="lowItemImageBox">
						<c:forEach items="${wearLowItem }" var="lowItem">
							<div class="slide">
								<!-- 이미지파일 -->
								<img alt="WearLowItem" data-name="${lowItem.rentalListLowItem }" 
								data-adultFee="${lowItem.rentalListItemAdultFee }" 
								data-num="${lowItem.rentalListItemNum }"
								src="${lowItem.imageUrl }">
								<p class="fs-5">${lowItem.rentalListLowItem }</p>
								<p class="fs-5">${lowItem.rentalListItemAdultFee }원</p>
							</div>
						</c:forEach>
					</div>
					
					
					<div class="itemImageBox" id="midItemImageBox" style="display: none;">
						
						<c:forEach items="${wearMidItem }" var="midItem">
							<div class="slide">
								<!-- 이미지파일 -->
								<img alt="WearMidItem" data-name="${midItem.rentalListMidItem }" 
								data-adultFee="${midItem.rentalListItemAdultFee }" 
								data-num="${midItem.rentalListItemNum }"
								src="${midItem.imageUrl }">
								<p class="fs-5">${midItem.rentalListMidItem }</p>
								<p class="fs-5">${midItem.rentalListItemAdultFee }원</p>
							</div>
						</c:forEach>
						
					</div>
					
		
					<div class="itemImageBox" id="premiumItemImageBox" style="display: none;">
						
						<c:forEach items="${wearPremiumItem }" var="premiumItem">
							<div class="slide">
								<!-- 이미지파일 -->
								<img alt="WearPremiumItem" data-name="${premiumItem.rentalListPremiumItem }" 
								data-adultFee="${premiumItem.rentalListItemAdultFee }" 
								data-num="${premiumItem.rentalListItemNum }"
								src="${premiumItem.imageUrl }">
								<p class="fs-5">${premiumItem.rentalListPremiumItem }</p>
								<p class="fs-5">${premiumItem.rentalListItemAdultFee }원</p>
							</div>
						</c:forEach>
						
					</div>
					
					<div class="slide-btn">
						<i class="bi bi-chevron-left slidePrevBtn" id="slidePrevBtn"></i>
						<i class="bi bi-chevron-right slideNextBtn" id="slideNextBtn"></i>
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