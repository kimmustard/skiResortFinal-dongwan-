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


<body style="overflow-x: hidden">
	<jsp:include page="../common/nav.jsp" />
	<div class="bodyContainer">
	
	<!-- 장바구니 -->
	<div class="shopContainer">
		<div class="shoppingBasket" id="shoppingBasket">
			<div class="shoppingBasketTitle">
				<p class="fs-4">장바구니</p>
				<p><button class="btn btn-outline-info reserveBtn" onclick="reservationBtn()">예약신청하기</button></p>
			</div>
			<div class="itemSelectDiv" id="itemSelectDiv">
			
			
			</div>
		</div>
	</div>
	
		<div class="itemMenuContainer">
			<ul class="nav nav-tabs justify-content-center">
			  <li class="nav-item">
			    <a class="nav-link" id="skiItem" href="#">스키</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" id="boardItem" href="#">스노우보드</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" id="wearItem" href="#">의류/보호장비</a>
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
		
		
		
		<div class="itemContainer" id="itemContainer">
		
			<div class="skiItemList" id="skiItemList">
				<div class="itemInfo">
					<!-- 스키시작 -->
					<!-- 스키시작 -->
					<!-- 스키시작 -->
					<div class="itemImageBox" id="skiLowItemImageBox" >
						<c:forEach items="${skiLowItem }" var="lowItem">
							<div class="slide">
								<!-- 이미지파일 -->
								<img alt="SkiLowItem" src="${lowItem.imageUrl }"
								data-name="${lowItem.rentalListLowItem }" 
								data-adultFee="${lowItem.rentalListItemAdultFee }" 
								data-kidFee="${lowItem.rentalListItemKidFee }" 
								data-num="${lowItem.rentalListItemNum }" 
								data-img="${lowItem.imageUrl }"
								data-count="${lowItem.rentalListItemCount }">
								<p class="fs-5">${lowItem.rentalListLowItem }</p>
								<c:choose>
									<c:when test="${fn:contains(lowItem.rentalListLowItem,'주니어') }">
										<p class="fs-5">${lowItem.rentalListItemKidFee }원</p>
									</c:when>
									<c:otherwise>
										<p class="fs-5">${lowItem.rentalListItemAdultFee }원</p>
									</c:otherwise>
								</c:choose>
								<p class="fs-5">수량 : ${lowItem.rentalListItemCount }개</p>
							</div>
						</c:forEach>
					</div>
					
					
					
					
					
					<div class="itemImageBox" id="skiMidItemImageBox" style="display: none;">
						<c:forEach items="${skiMidItem }" var="midItem">
							<div class="slide">
								<!-- 이미지파일 -->
								<img alt="SkiMidItem" data-name="${midItem.rentalListMidItem }" 
								data-adultFee="${midItem.rentalListItemAdultFee }" 
								data-kidFee="${midItem.rentalListItemKidFee }" 
								data-num="${midItem.rentalListItemNum }" 
								data-img="${midItem.imageUrl }"
								src="${midItem.imageUrl }"
								data-count="${midItem.rentalListItemCount }">
								<p class="fs-5">${midItem.rentalListMidItem }</p>
								<c:choose>
									<c:when test="${fn:contains(midItem.rentalListMidItem,'주니어') }">
										<p class="fs-5">${midItem.rentalListItemKidFee }원</p>
									</c:when>
									<c:otherwise>
										<p class="fs-5">${midItem.rentalListItemAdultFee }원</p>
									</c:otherwise>
								</c:choose>
								<p class="fs-5">수량 : ${midItem.rentalListItemCount }개</p>
							</div>
						</c:forEach>
					</div>
					
				
					
					
						
					
					<div class="itemImageBox" id="skiPremiumItemImageBox" style="display: none;">
						
						<c:forEach items="${skiPremiumItem }" var="premiumItem">
							<div class="slide">
								<!-- 이미지파일 -->
								<img alt="SkiPremiumItem" data-name="${premiumItem.rentalListPremiumItem }"
								 data-adultFee="${premiumItem.rentalListItemAdultFee }" 
								 data-kidFee="${premiumItem.rentalListItemKidFee }" 
								 data-num="${premiumItem.rentalListItemNum }" 
								 data-img="${premiumItem.imageUrl }"
								 src="${premiumItem.imageUrl }"
								 data-count="${premiumItem.rentalListItemCount }">
								<p class="fs-5">${premiumItem.rentalListPremiumItem }</p>
								<c:choose>
									<c:when test="${fn:contains(premiumItem.rentalListPremiumItem,'주니어') }">
										<p class="fs-5">${premiumItem.rentalListItemKidFee }원</p>
									</c:when>
									<c:otherwise>
										<p class="fs-5">${premiumItem.rentalListItemAdultFee }원</p>
									</c:otherwise>
								</c:choose>
								<p class="fs-5">수량 : ${premiumItem.rentalListItemCount }개</p>
							</div>
						</c:forEach>
						
					</div>
				</div>
			</div>
			
			<div class="boardItemList" id="boardItemList" style="display: none;">
				<div class="itemInfo">
			
					<!-- 보드 시작 -->
					<!-- 보드 시작 -->
					<!-- 보드 시작 -->
					<div class="itemImageBox" id="boardLowItemImageBox" style="display: none;">
						<c:forEach items="${boardLowItem }" var="lowItem">
							<div class="slide">
								<!-- 이미지파일 -->
								<img alt="BoardLowItem" data-name="${lowItem.rentalListLowItem }" 
								data-adultFee="${lowItem.rentalListItemAdultFee }" 
								data-kidFee="${lowItem.rentalListItemKidFee }" 
								data-num="${lowItem.rentalListItemNum }"
								data-img="${lowItem.imageUrl }"
								src="${lowItem.imageUrl }"
								data-count="${lowItem.rentalListItemCount }">
								<p class="fs-5">${lowItem.rentalListLowItem }</p>
								<c:choose>
									<c:when test="${fn:contains(lowItem.rentalListLowItem,'주니어') }">
										<p class="fs-5">${lowItem.rentalListItemKidFee }원</p>
									</c:when>
									<c:otherwise>
										<p class="fs-5">${lowItem.rentalListItemAdultFee }원</p>
									</c:otherwise>
								</c:choose>
								<p class="fs-5">수량 : ${lowItem.rentalListItemCount }개</p>
							</div>
						</c:forEach>
					</div>
					
					<div class="itemImageBox" id="boardMidItemImageBox" style="display: none;">
						
						<c:forEach items="${boardMidItem }" var="midItem">
							<div class="slide">
								<!-- 이미지파일 -->
								<img alt="BoardMidItem" data-name="${midItem.rentalListMidItem }" 
								data-adultFee="${midItem.rentalListItemAdultFee }" 
								data-kidFee="${midItem.rentalListItemKidFee }" 
								data-num="${midItem.rentalListItemNum }"
								data-img="${midItem.imageUrl }"
								src="${midItem.imageUrl }"
								data-count="${midItem.rentalListItemCount }">
								<p class="fs-5">${midItem.rentalListMidItem }</p>
								<c:choose>
									<c:when test="${fn:contains(midItem.rentalListMidItem,'주니어') }">
										<p class="fs-5">${midItem.rentalListItemKidFee }원</p>
									</c:when>
									<c:otherwise>
										<p class="fs-5">${midItem.rentalListItemAdultFee }원</p>
									</c:otherwise>
								</c:choose>
								<p class="fs-5">수량 : ${midItem.rentalListItemCount }개</p>
							</div>
						</c:forEach>
						
					</div>
					
					<div class="itemImageBox" id="boardPremiumItemImageBox" style="display: none;">
						
						<c:forEach items="${boardPremiumItem }" var="premiumItem">
							<div class="slide">
								<!-- 이미지파일 -->
								<img alt="BoardPremiumItem" data-name="${premiumItem.rentalListPremiumItem }" 
								data-adultFee="${premiumItem.rentalListItemAdultFee }" 
								data-kidFee="${premiumItem.rentalListItemKidFee }" 
								data-num="${premiumItem.rentalListItemNum }"
								data-img="${premiumItem.imageUrl }"
								src="${premiumItem.imageUrl }"
								data-count="${premiumItem.rentalListItemCount }">
								<p class="fs-5">${premiumItem.rentalListPremiumItem }</p>
								<c:choose>
									<c:when test="${fn:contains(premiumItem.rentalListPremiumItem,'주니어') }">
										<p class="fs-5">${premiumItem.rentalListItemKidFee }원</p>
									</c:when>
									<c:otherwise>
										<p class="fs-5">${premiumItem.rentalListItemAdultFee }원</p>
									</c:otherwise>
								</c:choose>
								<p class="fs-5">수량 : ${premiumItem.rentalListItemCount }개</p>
							</div>
						</c:forEach>
						
					</div>
					
				</div>
			</div>
			
			<div class="wearItemList" id="wearItemList" style="display: none;">
				<div class="itemInfo">
					
					<!-- 의류시작 -->
					<!-- 의류시작 -->
					<!-- 의류시작 -->
					<div class="itemImageBox" id="wearLowItemImageBox"  style="display: none;">
						<c:forEach items="${wearLowItem }" var="lowItem">
							<div class="slide">
								<!-- 이미지파일 -->
								<img alt="WearLowItem" data-name="${lowItem.rentalListLowItem }" 
								data-adultFee="${lowItem.rentalListItemAdultFee }" 
								data-num="${lowItem.rentalListItemNum }"
								data-img="${lowItem.imageUrl }"
								src="${lowItem.imageUrl }"
								data-count="${lowItem.rentalListItemCount }">
								<p class="fs-5">${lowItem.rentalListLowItem }</p>
								<p class="fs-5">${lowItem.rentalListItemAdultFee }원</p>
								<p class="fs-5">수량 : ${lowItem.rentalListItemCount }개</p>
							</div>
						</c:forEach>
					</div>
					
					<div class="itemImageBox" id="wearMidItemImageBox" style="display: none;">
						
						<c:forEach items="${wearMidItem }" var="midItem">
							<div class="slide">
								<!-- 이미지파일 -->
								<img alt="WearMidItem" data-name="${midItem.rentalListMidItem }" 
								data-adultFee="${midItem.rentalListItemAdultFee }" 
								data-num="${midItem.rentalListItemNum }"
								data-img="${midItem.imageUrl }"
								src="${midItem.imageUrl }"
								data-count="${midItem.rentalListItemCount }">
								<p class="fs-5">${midItem.rentalListMidItem }</p>
								<p class="fs-5">${midItem.rentalListItemAdultFee }원</p>
								<p class="fs-5">수량 : ${midItem.rentalListItemCount }개</p>
							</div>
						</c:forEach>
						
					</div>
					
					<div class="itemImageBox" id="wearPremiumItemImageBox" style="display: none;">
						
						<c:forEach items="${wearPremiumItem }" var="premiumItem">
							<div class="slide">
								<!-- 이미지파일 -->
								<img alt="WearPremiumItem" data-name="${premiumItem.rentalListPremiumItem }" 
								data-adultFee="${premiumItem.rentalListItemAdultFee }" 
								data-num="${premiumItem.rentalListItemNum }"
								data-img="${premiumItem.imageUrl }"
								src="${premiumItem.imageUrl }"
								data-count="${premiumItem.rentalListItemCount }">
								<p class="fs-5">${premiumItem.rentalListPremiumItem }</p>
								<p class="fs-5">${premiumItem.rentalListItemAdultFee }원</p>
								<p class="fs-5">수량 : ${premiumItem.rentalListItemCount }개</p>
							</div>
						</c:forEach>
						
					</div>
					
					
					
						</div>
			</div>
					
					
					
					
					
					
					
					
					
					
					
					
					<div class="slide-btn">
						
						<i class="bi bi-chevron-left slidePrevBtn" id="slidePrevBtn"></i>
						<i class="bi bi-chevron-right slideNextBtn" id="slideNextBtn"></i>
					</div>

					
				</div>
			</div>

	
	<script type="text/javascript">
		const memberEmail= `<c:out value="${mvo.memberEmail}"/>`;
		console.log(memberEmail);
	</script>
	
	<script type="text/javascript" src="/resources/js/rental/item.js"></script>
	
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>
