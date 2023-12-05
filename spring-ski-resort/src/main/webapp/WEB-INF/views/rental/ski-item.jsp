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
		display: flex;
		background-color: gray;
		justify-content: space-around;
		flex-wrap: wrap;
	}
	
	.itemImageBox div{
		width: 18%;
		height: 300px;	
		border: 2px solid black;
	}
	
	.itemImageBox div img{
		width: 100%;
		height: auto;
	}
	
	.textBox{
		width: 1200px;
		display: flex;
		justify-content: space-around;
		flex-wrap: wrap;
		margin-top: 30px;	
	}
	
	.textBox>div{
		width: 18%;
		height: 100px;
		text-align: center;
	}
	
	.textBox>div>p{
		font-weight: 700;
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
			    <a class="nav-link" href="/rental/wear-item">의류</a>
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
					<c:forEach items="${skiLowItem }" var="lowItem">
					<div class="itemImageBox" id="lowItemImageBox">
						<div>
							<!-- 이미지파일 -->
							<img alt="SkiLowItem" src="/upload/${fn: replace(lowItem.saveDir,'\\','/')}/${lowItem.uuid}_${lowItem.fileName}">
						</div>
					</div>
					</c:forEach>
					
					<c:forEach items="${skiMidItem }" var="midItem">
					<div class="itemImageBox" id="midItemImageBox" style="display: none;">
						<div>
							<!-- 이미지파일 -->
							<img alt="SkiLowItem" src="/upload/${fn: replace(midItem.saveDir,'\\','/')}/${midItem.uuid}_${midItem.fileName}">
						</div>
					</div>
					</c:forEach>
					
					<c:forEach items="${skiPremiumItem }" var="premiumItem">
					<div class="itemImageBox" id="premiumItemImageBox" style="display: none;">
						<div>
							<!-- 이미지파일 -->
							<img alt="SkiLowItem" src="/upload/${fn: replace(premiumItem.saveDir,'\\','/')}/${premiumItem.uuid}_${premiumItem.fileName}">
						</div>
					</div>
					</c:forEach>
					
				</div>
			</div>

				
		</div>

	</div>
	
	
	
	<script type="text/javascript" src="/resources/js/rental/item.js"></script>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>