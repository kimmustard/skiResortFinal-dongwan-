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
@import url('https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Inter:wght@500&display=swap');

	
	.itemContainer{
		width: 100%;
		background-image: url("https://media.cntraveler.com/photos/62bf943918f3fb2743f82f9d/16:9/w_1920,h_1080,c_limit/Coronet%20Peak,%20New%20Zealand_CP-6thAug-Instructor-368.jpg");
		height: 920px;
    	background-size: cover;
    	position: relative;
    	background-position: 0% -100px;
    
	}
	
	
	
	.itemList{
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
	
	
	

	.itemMenuContainer{	
		margin: 0 auto;
		position:relative;
		position: absolute;
		bottom: 0px;
		width: 100%;
		height:220px;
		display: flex;
		  background-image: linear-gradient(to bottom, transparent, white);
		  justify-content: space-evenly;

	}
	.itemMenuContainer>ul>li{
	position:relative;
	float: left;
    height: 140px;
    transform: translateY(-10px);
    background-size: cover;
    width: 130px;
    margin-left: 35px;
    margin-right: 35px;
     transition: 0.2s;
	}
	.itemMenuContainer>ul>li:hover{
	height: 150px;
    width: 140px;
	}
	.main_text_box{
	position: absolute;
    font-size: 195px;
    font-family: 'Bebas Neue', sans-serif;
    color: white;
    padding-right: 50%;
    padding-left: 10%;
    top: 260px;
	}
	.slidebtn{
		color: white;
    font-size: 65px;
    transform: translateY(25px);
	}
	
	.bi:hover{
	cursor:pointer; 
	}
	.move_rental{
	width: 170px;
    height: 40px;
    background-color: white;
    margin: 15px auto;
    font-family: 'Bebas Neue', sans-serif;
    color: black;
    font-size: 35px;
    text-align: CENTER;
    PADDING: 5PX;
    box-shadow: 0px 0px 10px rgba(0,0,0,0.8);
    position: absolute;
    left:600px;
    bottom: 65px;
	}
	.move_rental:hover {
	cursor: pointer;
}
	.showdow{
		bottom: 5px;
	    position: absolute;
	    width: 60%;
	    height: 1px;
	    border-radius: 100px;
	    box-shadow: 30px 35px 10px 1px rgba(0,0,0);
	}
	
	
</style>
</head>
<body>
	<jsp:include page="../common/nav.jsp" />
	
	<div class="bodyContainer">

	
		
		<div class="itemContainer">
		<div class="main_text_box">
			snowboarding gear
			
			<a href="/rental/ski-item"><div class="move_rental">rental</div></a> 
		</div>
			<div class="itemList">
				<div class="itemBox">
					
				</div>
			</div>
		</div>
		
			<div class="itemMenuContainer">
			<span class="slidebtn"><i class=" bi bi-chevron-compact-left"></i></span>
			<ul>
				<li style="background-image: url('https://i.imgur.com/17yQAx0.png');"> <div class="showdow"></div> </li>
				<li style="background-image: url('https://m.sportscore.co.kr/web/product/medium/202309/e4ca4a2288e8e3f9a1d2e2809f1d2a0d.png');"><div class="showdow"></div> </li>
				<li style="background-image: url('https://m.phoenixsports.co.kr/web/product/big/202210/5394612fb6cb33d6430c6676e5efd1e6.png');"><div class="showdow"></div> </li>
				<li style="background-image: url('https://koskomro.kr/jhj/img/dome/S-%ED%8C%A8%EB%94%A9%EC%9E%A5%EA%B0%91_1.jpg');"><div class="showdow"></div> </li>
				<li style="background-image: url('https://imgs.cowellfashion.com/goods/MB/MKUE/M/MBMKUEM1568/MBMKUEM1568_01.png');"><div class="showdow"></div> </li>
				<li style="background-image: url('https://kr.callawaygolf.com//wd/1280_k29YfuuAkbj95Q2D.png?1698106908');"><div class="showdow"></div> </li>
				
			</ul>
			<span class="slidebtn"><i class="slidebtn bi bi-chevron-compact-right"></i></span>
<!-- 			<ul class="nav nav-tabs justify-content-center"> -->
<!-- 			  <li class="nav-item"> -->
<!-- 			    <a class="nav-link" id="skiItem" href="/rental/ski-item">스키</a> -->
<!-- 			  </li> -->
<!-- 			  <li class="nav-item"> -->
<!-- 			    <a class="nav-link" id="boardItem" href="#">스노우보드</a> -->
<!-- 			  </li> -->
<!-- 			  <li class="nav-item"> -->
<!-- 			    <a class="nav-link" id="wearItem" href="#">의류/보호장비</a> -->
<!-- 			  </li>   -->
<!-- 			</ul> -->
		</div>
		
		
		
		
	
	
	</div>
	
	
	<script type="text/javascript" src="/resources/js/rental/item.js"></script>
	
	
	
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	
</body>
</html>
