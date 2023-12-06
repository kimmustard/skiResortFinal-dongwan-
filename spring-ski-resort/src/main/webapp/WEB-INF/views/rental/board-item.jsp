<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.bodyContainer{
		margin-top: 100px;
	}
	
	.itemMenuContainer{
		margin: 0 auto;
	}
	
	.menuCategory{
		width: 200px;
		margin-top:96px;
		position: fixed;
	    height: 100vh;
	    margin: 30px;
	}
	
	.itemContainer{
		position: relative;
		margin-left: 300px;
		width: 1200px;
		height: 1000px;
		overflow: hidden;
		display: flex;
	}
	
	.boardItemList{
		height: 1000px;
		
	}
	
	.itemImageBox{
		position: absolute;
		width: 5500px;
		margin: 0 auto;
		display: flex;
	}
	
	.itemImageBox div{	
		
		margin-bottom: 20px;
		box-sizing: border-box;
	}
	
	.itemImageBox div img{
		width: 400px;
		height: 600px;
		object-fit: cover;
	}
	
	.slide-btn{
	position: absolute;
	top: 650px;
	left: 1000px;
	}
	
</style>
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
							<div>
								<!-- 이미지파일 -->
								<img alt="BoardLowItem" src="/upload/${fn: replace(lowItem.fileSave,'\\','/')}/${lowItem.fileUuid}_${lowItem.fileName}">
							</div>
						</c:forEach>
					</div>
					
					
					
					
					<div class="itemImageBox" id="midItemImageBox" style="display: none;">
						
						<c:forEach items="${boardMidItem }" var="midItem">
							<div>
								<!-- 이미지파일 -->
								<img alt="BoardMidItem" src="/upload/${fn: replace(midItem.fileSave,'\\','/')}/${midItem.fileUuid}_${midItem.fileName}">
							</div>
						</c:forEach>
						
					</div>
					
					
					
					
		
					<div class="itemImageBox" id="premiumItemImageBox" style="display: none;">
						
						<c:forEach items="${boardPremiumItem }" var="premiumItem">
							<div>
								<!-- 이미지파일 -->
								<img alt="BoardPremiumItem" src="/upload/${fn: replace(premiumItem.fileSave,'\\','/')}/${premiumItem.fileUuid}_${premiumItem.fileName}">
							</div>
						</c:forEach>
						
					</div>
					
					<div class="slide-btn">
						<button id="slidePrevBtn" class="slidePrevBtn">◀</button>
						<button id="slideNextBtn" class="slideNextBtn">▶</button>
					</div>
					
					
					
	
				</div>
				
			</div>
		</div>

	</div>
	
	
	<script type="text/javascript" src="/resources/js/rental/item.js"></script>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>