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
	
	.menuCategory{
		width: 200px;
		margin-top:96px;
		position: fixed;
	    height: 100vh;
	    margin: 30px;
	}
	
	.categoryBox{
		margin-bottom: 50px;
	}
	
	.categoryBox>a{
		text-decoration: none;
	}
	
	.categoryBox>a:hover{
		background-color: yellow;
	}
	
	.skiItemList,.boardItemList,.wearItemList{
		height: 1000px;
		display: flex;
		justify-content: center;
		flex-wrap: wrap;
	}
	
	.itemImageBox{
		width: 1200px;
		
		display: flex;
		
		justify-content: space-around;
		flex-wrap: wrap;
		
	}
	
	.itemImageBox div{
		width: 18%;
		height: 300px;
		
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
	
		
		<div class="itemMenuContainer">
			<ul class="nav nav-tabs justify-content-center">
			  <li class="nav-item" id="skiItem">
			    <a class="nav-link" href="#">스키장비</a>
			  </li>
			  <li class="nav-item" id="boardItem">
			    <a class="nav-link" href="#">보드장비</a>
			  </li>
			  <li class="nav-item" id="wearItem">
			    <a class="nav-link" href="#">의류</a>
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
					<div class="itemImageBox">
						<div>
							<!-- 이미지 파일 표시 -->
							<img src="//one8.co.kr/web/product/medium/202310/7ffa01cd1d4ab7a40d2ad38f41349896.jpg" onerror="this.src=null_img" ori="//one8.co.kr/web/product/medium/202310/7ffa01cd1d4ab7a40d2ad38f41349896.jpg" id="eListPrdImage90229_1" class="thumb_Img" alt="P083 뵐클 남성 스키 세트" style="display:block; position:relative;width:100%; top:0px; left:0px; z-index:1">
						</div>
						<div>
							<!-- 이미지 파일 표시 -->
							<img src="//one8.co.kr/web/product/medium/202311/f09764f57eab506e7223f3dfdbda89d1.jpg" onerror="this.src=null_img" ori="//one8.co.kr/web/product/medium/202311/f09764f57eab506e7223f3dfdbda89d1.jpg" id="eListPrdImage97921_1" class="thumb_Img" alt="P047 노르디카 남성 스키 세트" style="display:block; position:relative;width:100%; top:0px; left:0px; z-index:1">
						</div>
						<div>
							<!-- 이미지 파일 표시 -->
							<img src="//one8.co.kr/web/product/medium/202310/992ef93964aec4fbbf628087a6dc826a.jpg" onerror="this.src=null_img" ori="//one8.co.kr/web/product/medium/202310/992ef93964aec4fbbf628087a6dc826a.jpg" id="eListPrdImage88936_1" class="thumb_Img" alt="P075 블리자드 남성 스키 세트" style="display:block; position:relative;width:100%; top:0px; left:0px; z-index:1">
						</div>
						<div>
							<!-- 이미지 파일 표시 -->
							<img src="//one8.co.kr/web/product/medium/202310/4d75387e4382861a9879a29cde83aa9f.jpg" onerror="this.src=null_img" ori="//one8.co.kr/web/product/medium/202310/4d75387e4382861a9879a29cde83aa9f.jpg" id="eListPrdImage90161_1" class="thumb_Img" alt="P015 아토믹 남녀공용 스키 세트" style="display:block; position:relative;width:100%; top:0px; left:0px; z-index:1">
						</div>
						<div>
							<!-- 이미지 파일 표시 -->
							<img src="//one8.co.kr/web/product/medium/202310/a9571feb93da5bd6f46fa1e370a25d0d.jpg" onerror="this.src=null_img" ori="//one8.co.kr/web/product/medium/202310/a9571feb93da5bd6f46fa1e370a25d0d.jpg" id="eListPrdImage75069_1" class="thumb_Img" alt="P003 아토믹 남성 스키 세트" style="display:block; position:relative;width:100%; top:0px; left:0px; z-index:1">
						</div>
					</div>
					
					<div class="textBox">
						
						<div>
							<p class="fs-5">뷜클 남성 스키 세트</p>
						</div>
						<div>
							<p class="fs-5">노르디카 남성 스키 세트</p>
						</div>
						<div>
							<p class="fs-5">블리자드 남성 스키 세트</p>
						</div>
						<div>
							<p class="fs-5">아토믹 남녀공용 스키 세트</p>
						</div>
						<div>
							<p class="fs-5">아토믹 남성 스키 세트</p>
						</div>
						
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