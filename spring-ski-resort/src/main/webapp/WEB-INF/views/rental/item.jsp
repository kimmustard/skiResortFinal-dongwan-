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
	
	.itemContainer{
		width: 100%;
	}
	
	
	
	.itemList{
		height: 1000px;
		display: flex;
		justify-content: center;
		flex-wrap: wrap;
	}
	
	.itemBox{
		width: 1200px;
		display: flex;
		background-color: gray;
		justify-content: space-around;
		flex-wrap: wrap;
	}
	
	.itemBox div{
		width: 18%;
		height: 300px;	
		border: 2px solid black;
	}
	
	.itemBox div img{
		width: 100%;
		height: auto;
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
	
	
</style>
</head>
<body>
	<jsp:include page="../common/nav.jsp" />
	
	<div class="bodyContainer">
	
		
		<div class="itemMenuContainer">
			<ul class="nav nav-tabs justify-content-center">
			  <li class="nav-item">
			    <a class="nav-link" id="skiItem" href="/rental/ski-item">스키</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" id="boardItem" href="#">스노우보드</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" id="wearItem" href="#">의류/보호장비</a>
			  </li>  
			</ul>
		</div>
		
		
		
		
		<div class="itemContainer">
			<div class="itemList">
				<div class="itemBox">
					<p class="fs-1">장비메인이미지</p>
				</div>
			</div>
		</div>
		
		
		
		<div class="btnContainer">

			<a href="/rental/item-register"><button type="button" class="btn btn-outline-primary">파일등록페이지</button></a>
			
		</div>
		
	
	
	</div>
	
	
	<script type="text/javascript" src="/resources/js/rental/item.js"></script>
	
	
	
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	
</body>
</html>
