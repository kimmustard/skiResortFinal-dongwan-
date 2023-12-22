<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/resort/resort.css">
</head>
<body>
	<jsp:include page="../common/nav.jsp"></jsp:include>
	<div class="resort-main-container">
		<div class="mainBackground">
		</div>
	
		<div class="slope">
			<h2> 슬로프 안내 </h2>
			
			<div class="slope-box">
				<div class="slope-manual">
									
					<h2>Slope Category</h2>
					<ul class="slope-category">
						<li id="slope-html" onclick="slopeMapAction('slope-html-map')">HTML</li>
						<li id="slope-js" onclick="slopeMapAction('slope-js-map')">JAVASCRIPT</li>
						<li id="slope-python" onclick="slopeMapAction('slope-python-map')">PYTHON</li>
						<li id="slope-java" onclick="slopeMapAction('slope-java-map')">JAVA</li>
						<li id="slope-spring" onclick="slopeMapAction('slope-spring-map')">SPRING</li>
					</ul>
					
				</div>
				<div class="slope-map">
					<img id="slope-html-map" alt="" src="https://i.imgur.com/UIsywju.png">
					<img id="slope-js-map" alt="" src="https://i.imgur.com/w8tyHfz.png">
					<img id="slope-python-map" alt="" src="https://i.imgur.com/ykTy5wo.png">
					<img id="slope-java-map" alt="" src="https://i.imgur.com/N41QgCe.png">
					<img id="slope-spring-map" alt="" src="https://i.imgur.com/EgRaUPB.png">
				</div>
			</div>
			
			
		</div>
		
		<div class="newContent">
			<img alt="" src="https://i.imgur.com/r0xroWO.png" height="300">
		</div>
		
		<div class="newItemContent">
			<h2> SKI ITEM SERVICE</h2>
			<img alt="" src="https://i.imgur.com/83DLkwE.jpg">
		</div>
	</div>
	
	
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	
	
	<script type="text/javascript" src="/resources/js/resort/resort.js"></script>
</body>
</html>