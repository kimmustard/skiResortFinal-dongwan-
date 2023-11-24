<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장비안내 페이지</title>
<style type="text/css">
	.h1{
		text-align: center;
	}
	.itemContainer{
		display: flex;
		flex-wrap: wrap;
		justify-content: center;
		height: 1200px;
		background-color: gray;
	}
	
	.itemImageBox1,.itemImageBox2,
	.itemImageBox3,.itemImageBox4,
	.itemImageBox5,.itemImageBox6{
		width: calc(15% - 40px);
		height: 200px;
		margin: 0 20px;
		margin-top: 100px;
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
	
	.itemLinkBox1{
		width: 100px;
		background-color: navy;
	}
	.itemLinkBox2{
		width: 100px;
		background-color: lime;
	}
	.itemLinkBox3{
		width: 100px;
		background-color: aqua;
	}
</style>
</head>
<body>
	<jsp:include page="../common/nav.jsp" />
	
	<h1 class="h1">장비안내</h1>
	
	<div class="itemLinkBox1">
		<div class="itemLink">
			<a href="">스키장비</a>
		</div>
	</div>
	
	<div class="itemLinkBox2">
		<div class="itemLink">
			<a href="">보드장비</a>
		</div>
	</div>
	<div class="itemLinkBox3">
		<div class="itemLink">
			<a href="">의류</a>
		</div>
	</div>
	
	<form action="/rental/item" method="post" enctype="murtipart/form-datas">
		<div class="itemContainer">
			<div class="itemImageBox1">
				<div>
					<!-- 이미지 파일 표시 -->
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

	
	<script type="text/javascript" src="/resources/js/rental/rentalRegister.js"></script>
	
	
</body>
</html>