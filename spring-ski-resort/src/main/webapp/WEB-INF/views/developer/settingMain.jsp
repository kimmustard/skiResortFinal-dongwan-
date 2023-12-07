<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link  href="/resources/css/developer/setting.css" rel="stylesheet">
</head>
<body>
	<div class="devMainContainer">
		<div class="devNav">
			<div class="marquee marquee1">
				  <p class="marquee-text"><img alt="" height="50" src="/resources/etc/line.png"></p>
				</div>
			
		</div>
		
		<div class="devBody">
			
			<jsp:include page="../common/devCategory.jsp"></jsp:include>
			

			<div class="mmmmainContainer">
			<!-- 각자 페이지 개발구역 -->
				<div class="ppppeople-status">
					<h1>관리자 페이지입니다.</h1>
					<div>
						<p>총 멤버 수 : n 명</p>
						<p>최종 정산 : 0 원</p>
						<p>일일 방문횟수 : n 명</p> 
						<p>주간 방문횟수 : n 명</p> 
						<p>월간 방문횟수 : n 명</p> 
					</div>
				</div>
			
			</div>
			
			
		</div>

	
	
	
	</div>
	<script type="text/javascript" src="/resources/js/developer/setting.js"></script>
</body>
</html>