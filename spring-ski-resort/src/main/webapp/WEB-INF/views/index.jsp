<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
<link rel="stylesheet" href="/resources/css/index.css">
</head>
<body>
	<jsp:include page="common/nav.jsp"></jsp:include>
	<div class="ytLandscape" id="ytLandscape">
	<!-- 	<iframe
			src="https://www.youtube.com/embed/h1VWRkX8vD8?si=hXoOA0167YGh5z27&autoplay=1&mute=1&controls=0&loop=1&playlist=h1VWRkX8vD8&modestbranding=1"
			title="YouTube video player" frameborder="0"
			allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
			allowfullscreen> </iframe> -->
			
		<!-- 	<iframe
			src="https://www.youtube-nocookie.com/embed/4hESncfGTyE?si=2klehek2I1xT6Nts&autoplay=1&mute=1&loop=1&amp;controls=0" 
			title="YouTube video player" 
			frameborder="0" 
			allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
			allowfullscreen></iframe> -->
		
			<iframe width="560" height="315" 
			src="https://www.youtube.com/embed/fbqHK8i-HdA?si=x8stsZdudUJ74Zay&autoplay=1&mute=1&loop=1&playlist=fbqHK8i-HdA&modestbranding=1&amp;controls=0&amp;start=250" 
			title="YouTube video player" 
			frameborder="0" 
			allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
			allowfullscreen></iframe>
			
		<h1 id="maintext1"  >好き</h1>
		<h1 id="maintext2">DAISUSKI</h1>


		<div id="wrapper">
			<div id="innerItem1"></div>
			<div id="innerItem2"></div>
			<div id="innerItem3"></div>
			<div id="innerItem4"></div>
		</div>
	</div>

	<!-- index 영상 아래 들어갈 내용은 여기에  -->
		<div class="index-content" >
		<div id="notice-box">		
			<h1 class="notice-logo eventbgc">INFORMATION</h1>
		<div id="notice">
		
		</div>

		</div>
		<div class="triangle-top"></div>
		<div class="event-box none-click" >
			<p class="fs-1 box-title">Event</p>
			<p class=" box-title">이벤트</p>
			<div class="contentBox">
				  <div class="slide_wrapper">
		      <ul class="slides" id="slides" >
     			</ul>
		    </div>
		    <p class="controls">
		      <span class="prev"><i class="bi bi-chevron-compact-left"></i></span>
		       <span id="slide-page-num" >1/6</span>
		      <span class="next"><i class="bi bi-chevron-compact-right"></i></span>
		    </p>
  		    </div>
		</div>
		<div class="triangle-bottom"></div>
	</div>
	
<!-- 	<div class="news-topic-box"> -->
<!-- 			<p class="fs-1 box-title">News & Topic</p> -->
<!-- 			<p class="fs-3 box-title">뉴스 & 토픽</p> -->
<!-- 		</div> -->
	

	<jsp:include page="common/footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
const isOk = parseInt('<c:out value="${isOk}" />');
if (isOk === 1) {
    alert('쿠폰 지급 완료!!');
} else if (isOk === 2) {
    alert('이미 받은 쿠폰입니다.');
}
</script>
<script type="text/javascript" src="/resources/js/index.js"></script>
</html>
