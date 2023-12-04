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
			
				<c:forEach items="${rldto.ritvo}" var="ritvo">
					<c:if test="${ritvo.rentalListItemType eq '스키'}">
						<div class="itemInfo">	
							<c:if test="${ritvo.rentalListItemGrade eq '일반장비' }">
								<div class="itemImageBox" id="lowItemImageBox">
									<c:forEach items="${rldto.flist}" var="fvo">
										<c:if test="${fvo.rentalListItemNum eq ritvo.rentalListItemNum }">
											
											<div>
												<!-- 이미지 파일 표시 -->
												<img alt="이미지없음" src="/upload/${fn: replace(fvo.saveDir,'\\','/')}/${fvo.uuid}_${fvo.fileName}">
											</div>
										
										</c:if>
									</c:forEach>
									
								</div>
							
								<div class="textBox" id="lowItemTextBox">
									
									<div>
										<p class="fs-5">${ritvo.rentalListLowItem }</p>
									</div>
									<div>
										
									</div>
									<div>
										
									</div>
									<div>
										
									</div>
									<div>
										
									</div>
								
									
								</div>
							</c:if>
							
									<c:if test="${ritvo.rentalListItemGrade eq '중급장비' }">
									
								<div class="itemImageBox" id="midItemImageBox" style="display: none;">
									<c:forEach items="${rldto.flist}" var="fvo">
									${fvo.rentalListItemNum }ss
										<c:if test="${ritvo.rentalListItemNum eq fvo.rentalListItemNum }">
									
											<div>
												<!-- 이미지 파일 표시 -->
												<img alt="이미지없음" src="/upload/${fn: replace(fvo.saveDir,'\\','/')}/${fvo.uuid}_${fvo.fileName}">
											</div>
											
										</c:if>
									</c:forEach>
								</div>
									</c:if>
								
								<div class="textBox" id="midItemTextBox" style="display: none;">
									
										<div>
											<p class="fs-5">${ritvo.rentalListMidItem }</p>
										</div>
										<div>
											
										</div>
										<div>
											
										</div>
										<div>
											
										</div>
										<div>
											
										</div>
									
								</div>
					
							
							<c:if test="${ritvo.rentalListItemGrade eq '프리미엄장비' }">
								<div class="itemImageBox" id="premiumItemImageBox" style="display: none;">
									<c:forEach items="${rldto.flist}" var="fvo">
										<c:if test="${fvo.rentalListItemNum eq ritvo.rentalListItemNum }">
											<div>
												<!-- 이미지 파일 표시 -->	
												<img alt="이미지없음" src="/upload/${fn: replace(fvo.saveDir,'\\','/')}/${fvo.uuid}_${fvo.fileName}">
											</div>
											<div>
												<!-- 이미지 파일 표시 -->
												
											</div>
											<div>
												<!-- 이미지 파일 표시 -->
											</div>
											<div>
												<!-- 이미지 파일 표시 -->
											</div>
											<div>
												<!-- 이미지 파일 표시 -->
											</div>
										</c:if>
									</c:forEach>
								</div>
								
								<div class="textBox" id="premiumItemTextBox" style="display: none;">
									
									<div>
										<p class="fs-5">${ritvo.rentalListPremiumItem }</p>
									</div>
									<div>
										
									</div>
									<div>
										
									</div>
									<div>
										
									</div>
									<div>
										
									</div>
									
								</div>
							</c:if>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>

	</div>
	
	
	
	<script type="text/javascript" src="/resources/js/rental/item.js"></script>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>