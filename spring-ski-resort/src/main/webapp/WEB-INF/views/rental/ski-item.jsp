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
		width: 100%;
	}
	
	.skiItemList{
		height: 1000px;
		display: flex;
		justify-content: center;
		flex-wrap: wrap;
	}
	
	.itemImageBox{
		width: 1200px;
		margin: 0 auto;
		display: flex;
		justify-content: space-between;
		flex-wrap: wrap;
	}
	
	.itemImageBox div{
		width: 48%;
		height: 600px;	
		border: 2px solid black;
		margin-bottom: 20px;
		overflow: hidden;
		box-sizing: border-box;
	}
	
	.itemImageBox div img{
		width: 100%;
		height: 100%;
		object-fit: cover;
	}
	
	#prevButtonId,
	#nextButtonId {
	  display: block;
	  margin: 10px;
	  padding: 10px 20px;
	  background-color: #3498db;
	  color: #fff;
	  border: none;
	  cursor: pointer;
	  font-size: 16px;
	  border-radius: 5px;
	}
	
	#prevButtonId:hover,
	#nextButtonId:hover {
	  background-color: #2980b9;
	}
	
	
</style>
</head>
<body>
	<jsp:include page="../common/nav.jsp" />
	<div class="bodyContainer">
	
		<div class="itemMenuContainer">
			<ul class="nav nav-tabs justify-content-center">
			  <li class="nav-item" id="skiItem">
			    <a class="nav-link" href="/rental/ski-item">스키장비</a>
			  </li>
			  <li class="nav-item" id="boardItem">
			    <a class="nav-link" href="/rental/board-item">보드장비</a>
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
		
			<div class="skiItemList" id="skiItemList">
				<div class="itemInfo">
					<div class="itemImageBox" id="lowItemImageBox">
						<c:forEach items="${skiLowItem }" var="lowItem">
							<div>
								<!-- 이미지파일 -->
								<img alt="SkiLowItem" src="/upload/${fn: replace(lowItem.fileSave,'\\','/')}/${lowItem.fileUuid}_${lowItem.fileName}">
							</div>
						</c:forEach>
					</div>
					
					
					
					
					
					<div class="itemImageBox" id="midItemImageBox" style="display: none;">
						<c:forEach items="${skiMidItem }" var="midItem">
							<div>
								<!-- 이미지파일 -->
								<img alt="SkiMidItem" src="/upload/${fn: replace(midItem.fileSave,'\\','/')}/${midItem.fileUuid}_${midItem.fileName}">
							</div>
						</c:forEach>
					</div>
					
				
					
					
						
					
					<div class="itemImageBox" id="premiumItemImageBox" style="display: none;">
						<c:forEach items="${skiPremiumItem }" var="premiumItem">
							<div>
								<!-- 이미지파일 -->
								<img alt="SkiPremiumItem" src="/upload/${fn: replace(premiumItem.fileSave,'\\','/')}/${premiumItem.fileUuid}_${premiumItem.fileName}">
								
							</div>
						</c:forEach>
						
					</div>
					
					

					
					
				</div>
			</div>

			<button id="slidePrevBtn">◀</button>
			<button id="slideNextBtn">▶</button>
				
		</div>

	</div>
	
	
	
	<script type="text/javascript" src="/resources/js/rental/item.js"></script>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>