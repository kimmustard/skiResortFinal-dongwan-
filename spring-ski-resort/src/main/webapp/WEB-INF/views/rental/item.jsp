<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장비안내 페이지</title>
<style type="text/css">
	.bodyContainer{
		margin-top: 100px;
	}
	
	.h1{
		margin-top: 96px;
		text-align: center;
	}
	
	.itemContainer{
		width: 100%;
	}
	
	
	.skiItemList,.boardItemList,.wearItemList{
		height: 1000px;
		display: flex;
		justify-content: center;
		flex-wrap: wrap;
	}
	
	.itemImageBox{
		width: 1200px;
		border: 2px solid black;
		display: flex;
		background-color:gray;
		justify-content: space-around;
		flex-wrap: wrap;
		
	}
	.itemImageBox div{
		width: 18%;
		height: 300px;
		background-color: lightgreen;
	}
	.btnContainer{
		display: flex;
		justify-content: center;
	}
	.btn-outline-primary{
		margin-left: 20px;
		margin-right: 20px;
	}
	
	.itemMenuContainer{
		margin: 0 auto;
	}
	
	.menuCategory{
		display: flex;
		flex-direction: row;
		justify-content: center;
		
	}
		
	.menuList{
		background-color: red;
		margin-right: 20px;
	}

</style>
</head>
<body>
	<jsp:include page="../common/nav.jsp" />
	
	<div class="bodyContainer">
	
		<h1 class="h1">장비안내</h1>
		
		<div class="itemMenuContainer">
			<ul class="nav nav-tabs justify-content-center">
			  <li class="nav-item" id="skiItem">
			    <a class="nav-link" href="#">스키장비SET</a>
			  </li>
			  <li class="nav-item" id="boardItem">
			    <a class="nav-link" href="#">보드장비SET</a>
			  </li>
			  <li class="nav-item" id="wearItem">
			    <a class="nav-link" href="#">의류</a>
			  </li>  
			</ul>
		</div>
		
		
		<div class="itemContainer">
			<div class="skiItemList" id="skiItemList">
				<div class="itemInfo">
					<div class="itemImageBox">
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
						<div>
							<!-- 이미지 파일 표시 -->
						</div>
					</div>
					
					<div class="textBox">
						
					</div>
				</div>
			</div>
			
			
			<div class="boardItemList" id="boardItemList" style="display: none;">
				<div class="itemInfo">
					<div class="itemImageBox">
						<div>
							<!-- 이미지 파일 표시 -->
							보드장비
						</div>
						<div>
							<!-- 이미지 파일 표시 -->
							보드장비
						</div>
						<div>
							<!-- 이미지 파일 표시 -->
							보드장비
						</div>
						<div>
							<!-- 이미지 파일 표시 -->
							보드장비
						</div>
						<div>
							<!-- 이미지 파일 표시 -->
							보드장비
						</div>
					</div>
				</div>
			</div>
			
			<div class="wearItemList" id="wearItemList" style="display: none;">
				<div class="itemInfo">
					<div class="itemImageBox">
						<div>
							<!-- 이미지 파일 표시 -->
							의류
						</div>
						<div>
							<!-- 이미지 파일 표시 -->
							의류
						</div>
						<div>
							<!-- 이미지 파일 표시 -->
							의류
						</div>
						<div>
							<!-- 이미지 파일 표시 -->
							의류
						</div>
						<div>
							<!-- 이미지 파일 표시 -->
							의류
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="btnContainer">
			
			
			<a href="/rental/item-register"><button type="button" class="btn btn-outline-primary">파일등록페이지</button></a>
			
		</div>
		
		
		
		<!-- 페이징 기능 들어갈지말지 -->
	
	
	</div>
	
	
	<script type="text/javascript" src="/resources/js/rental/item.js"></script>
	
	
	
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	
</body>
</html>