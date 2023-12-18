<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이스키 버스노선 안내</title>
<jsp:include page="../common/nav.jsp" />
<link rel="stylesheet" href="/resources/css/bus/busList.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.mvo.authList" var="auths"/>
	<sec:authentication property="principal.mvo.memberId" var="authId"/>
	<sec:authentication property="principal.mvo.memberEmail" var="authEmail"/>
	<sec:authentication property="principal.mvo.memberType" var="authType"/>
</sec:authorize>

<div class="bus-img-container" style="background-image: url('https://rusutsu.com/wp-content/uploads/rusutsu-powder-day-trip.jpg')">	</div>

<div class="container bus-container">
	<div class="bus-menu-container">
	  <div class="bus-menu-container-child">
	    <div class="bus-tag-container">
			<ul>
				<li>
					<a>
						<button type="button" class="bus-btn mybus-btn">셔틀버스 예약</button>
					</a>
				</li>
				<li>
					<a>
						<button type="button" class="bus-btn mybus-btn">예약 안내</button>
					</a>
				</li>
				<li>
					<a href="/bus/busMap">
						<button type="button" class="bus-btn mybus-btn">노선 보기</button>
					</a>
				</li>
			</ul>
			
			
			
			<div class="bus-list-container">
			<h1>강남선</h1>
			<div class="accordion accordion-flush bus-list" id="accordionFlushExample">
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
			        <span class="bus-time">08:10</span>
			        <span class="bus-location">신논현역 6번 출구 (교보타워 건물 입구)</span>
			      </button>
			    </h2>
			    <div id="flush-collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the first item's accordion body.</div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
			        <span class="bus-time">08:15</span>
			        <span class="bus-location">강남역 5번 출구 (삼성화재 건물)</span>
			      </button>
			    </h2>
			    <div id="flush-collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the second item's accordion body. Let's imagine this being filled with some actual content.</div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
			        <span class="bus-time">08:18</span>
			        <span class="bus-location">양재역 2번 출구 KW컨벤션센터 앞</span>
			      </button>
			    </h2>
			    <div id="flush-collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the third item's accordion body. Nothing more exciting happening here in terms of content, but just filling up the space to make it look, at least at first glance, a bit more representative of how this would look in a real-world application.</div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapsefour" aria-expanded="false" aria-controls="flush-collapsefour">
			        <span class="bus-time">08:18</span>
			        <span class="bus-location">양재역 2번 출구 KW컨벤션센터 앞</span>
			      </button>
			    </h2>
			    <div id="flush-collapsefour" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the third item's accordion body. Nothing more exciting happening here in terms of content, but just filling up the space to make it look, at least at first glance, a bit more representative of how this would look in a real-world application.</div>
			    </div>
			  </div>
			</div>
			</div>
			
			
			<div class="bus-list-container">
			<h1>광화문</h1>
			<div class="accordion accordion-flush bus-list" id="accordionFlushExample">
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
			        <span class="bus-time">07:40</span>
			        <span class="bus-location">세종미술관 앞</span>
			      </button>
			    </h2>
			    <div class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the first item's accordion body.</div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
			        <span class="bus-time">07:50</span>
			        <span class="bus-location">회현동 우리은행 후문 앞(3호 터널 입구)</span>
			      </button>
			    </h2>
			    <div class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the first item's accordion body.</div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
			        <span class="bus-time">07:55</span>
			        <span class="bus-location">이태원 크라운호텔 건너편 육교</span>
			      </button>
			    </h2>
			    <div class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the first item's accordion body.</div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
			        <span class="bus-time">08:05</span>
			        <span class="bus-location">반포쇼핑타운 8동 맞은편 GS주유소 가기전</span>
			      </button>
			    </h2>
			    <div class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the first item's accordion body.</div>
			    </div>
			  </div>
			</div>
			</div>
			
			
			<div class="bus-list-container">
			<h1>분당선</h1>
			<div class="accordion accordion-flush bus-list" id="accordionFlushExample">
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
			        <span class="bus-time">07:50</span>
			        <span class="bus-location">낙성육교(서현방향)</span>
			      </button>
			    </h2>
			    <div class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the first item's accordion body.</div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
			        <span class="bus-time">07:58</span>
			        <span class="bus-location">서현역 공항버스정류장 50M 앞 육교아래(수내방향)</span>
			      </button>
			    </h2>
			    <div class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the first item's accordion body.</div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
			        <span class="bus-time">08:05</span>
			        <span class="bus-location">정자역 3번출구(100M앞 파리바게뜨)</span>
			      </button>
			    </h2>
			    <div class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the first item's accordion body.</div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
			        <span class="bus-time">08:05</span>
			        <span class="bus-location">반포쇼핑타운 8동 맞은편 GS주유소 가기전</span>
			      </button>
			    </h2>
			    <div class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the first item's accordion body.</div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
			        <span class="bus-time">08:05</span>
			        <span class="bus-location">반포쇼핑타운 8동 맞은편 GS주유소 가기전</span>
			      </button>
			    </h2>
			    <div class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the first item's accordion body.</div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
			        <span class="bus-time">08:05</span>
			        <span class="bus-location">반포쇼핑타운 8동 맞은편 GS주유소 가기전</span>
			      </button>
			    </h2>
			    <div class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the first item's accordion body.</div>
			    </div>
			  </div>
			</div>
			</div>
			
	    </div>
	  </div>
	</div>
</div>

<jsp:include page="../common/footer.jsp" />	
</body>
</html>