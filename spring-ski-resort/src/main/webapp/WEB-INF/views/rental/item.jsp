<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		flex-direction: row;
		justify-content: center;
	}
	
	.itemImageBox1,.itemImageBox2,
	.itemImageBox3,.itemImageBox4{
		width: 200px;
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
</style>
</head>
<body>
	<jsp:include page="../common/nav.jsp" />
	
	<h1 class="h1">장비안내</h1>
	
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
	</div>
	
	<div>
  		<input type="file" name="files" id="files" style="display: none;" multiple="multiple">
  		<button type="button" id="trigger" class="btn btn-outline-primary">파일선택</button>
	</div>

	<div>
		<button type="submit" class="btn btn-outline-primary">등록</button>
	</div>
	
	
</body>
</html>