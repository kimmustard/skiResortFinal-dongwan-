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
		<jsp:include page="../common/devNav.jsp"></jsp:include>
		
		<div class="devBody">
			
			<jsp:include page="../common/devCategory.jsp"></jsp:include>
			
			<!-- 각자 페이지 개발구역 -->

			<div>
				<h1>관리자 페이지입니다.</h1>
				<div>
					<p>일일 방문횟수 : n 명</p> 
					<p>주간 방문횟수 : n 명</p> 
					<p>월간 방문횟수 : n 명</p> 
				</div>
			</div>
			
			
		</div>

	
	
	
	</div>
	<script type="text/javascript" src="/resources/js/developer/setting.js"></script>
</body>
</html>