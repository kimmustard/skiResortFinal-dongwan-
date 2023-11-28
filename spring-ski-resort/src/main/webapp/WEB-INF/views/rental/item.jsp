<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	
	.ItemContainer{
		width: 100%;
		background-color: gray;
	}
	
	.skiItemList,.boardItemList,.wearItemList{
		height: 1000px;
		display: flex;
		justify-content: center;
		flex-wrap: wrap;
	}
	
	.itemImageBox1,.itemImageBox2,
	.itemImageBox3,.itemImageBox4,
	.itemImageBox5,.itemImageBox6{
		width: calc(15% - 40px);
		height: 300px;
		margin: 100px 20px 0 20px;
	}
	.itemImageBox1{
		background-color: red;
	}
	.itemImageBox2{
		background-color: blue;
	}
	.itemImageBox3{
		background-color: yellow;
	}
	.itemImageBox4{
		background-color: green;
	}
	.itemImageBox5{
		background-color: orange;
	}
	.itemImageBox6{
		background-color: purple;
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
		
		<form action="/rental/item" method="post" enctype="murtipart/form-datas">
			<div class="ItemContainer">
				
				<div class="skiItemList" id="skiItemList">
					<div class="itemImageBox1">
						<div>
							<!-- 이미지 파일 표시 -->
							스키장비
						</div>
					</div>
					<div class="itemImageBox2">
						<div>
							<!-- 이미지 파일 표시 -->
						</div>
					</div>
					<div class="itemImageBox3">
						<div>
							<!-- 이미지 파일 표시 -->
						</div>
					</div>
					<div class="itemImageBox4">
						<div>
							<!-- 이미지 파일 표시 -->
						</div>
					</div>
					<div class="itemImageBox5">
						<div>
							<!-- 이미지 파일 표시 -->
						</div>
					</div>
					<div class="itemImageBox6">
						<div>
							<!-- 이미지 파일 표시 -->
						</div>
					</div>
				</div>
				
				
				<div class="boardItemList" id="boardItemList" style="display: none;">
					<div class="itemImageBox1">
						<div>
							<!-- 이미지 파일 표시 -->
							보드장비
						</div>
					</div>
					<div class="itemImageBox2">
						<div>
							<!-- 이미지 파일 표시 -->
						</div>
					</div>
					<div class="itemImageBox3">
						<div>
							<!-- 이미지 파일 표시 -->
						</div>
					</div>
					<div class="itemImageBox4">
						<div>
							<!-- 이미지 파일 표시 -->
						</div>
					</div>
					<div class="itemImageBox5">
						<div>
							<!-- 이미지 파일 표시 -->
						</div>
					</div>
					<div class="itemImageBox6">
						<div>
							<!-- 이미지 파일 표시 -->
						</div>
					</div>
				</div>
				
				<div class="wearItemList" id="wearItemList" style="display: none;">
					<div class="itemImageBox1">
						<div>
							<!-- 이미지 파일 표시 -->
							의류
						</div>
					</div>
					<div class="itemImageBox2">
						<div>
							<!-- 이미지 파일 표시 -->
						</div>
					</div>
					<div class="itemImageBox3">
						<div>
							<!-- 이미지 파일 표시 -->
						</div>
					</div>
					<div class="itemImageBox4">
						<div>
							<!-- 이미지 파일 표시 -->
						</div>
					</div>
					<div class="itemImageBox5">
						<div>
							<!-- 이미지 파일 표시 -->
						</div>
					</div>
					<div class="itemImageBox6">
						<div>
							<!-- 이미지 파일 표시 -->
						</div>
					</div>
				</div>
			</div>
	
			<div class="btnContainer">
				<div>
			  		<input type="file" name="files" id="files" style="display: none;" multiple="multiple">
			  		<button type="button" id="trigger" class="btn btn-outline-primary">파일선택</button>
				</div>
				
				<div>
					<button type="submit" class="btn btn-outline-primary">등록</button>
				</div>
			</div>
		
		</form>
		
		<!-- 페이징 기능 들어갈지말지 -->
	
	
	</div>
	
	
	<script type="text/javascript" src="/resources/js/rental/item.js"></script>
	<script type="text/javascript" src="/resources/js/rental/rentalRegister.js"></script>
	
	
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	
</body>
</html>