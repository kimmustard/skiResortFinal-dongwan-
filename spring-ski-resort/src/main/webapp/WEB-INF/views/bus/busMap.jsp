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
			</div>
			</div>
			
			
			<div class="bus-list-container">
			<h1>광화문</h1>
			<div class="accordion accordion-flush bus-list" id="accordionFlushExample">
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapsefour" aria-expanded="false" aria-controls="flush-collapsefour">
			        <span class="bus-time">07:40</span>
			        <span class="bus-location">세종미술관 앞</span>
			      </button>
			    </h2>
			    <div id="flush-collapsefour" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the first item's accordion body.</div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse5" aria-expanded="false" aria-controls="flush-collapse5">
			        <span class="bus-time">07:50</span>
			        <span class="bus-location">회현동 우리은행 후문 앞(3호 터널 입구)</span>
			      </button>
			    </h2>
			    <div id="flush-collapse5" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the first item's accordion body.</div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse6" aria-expanded="false" aria-controls="flush-collapse6">
			        <span class="bus-time">07:55</span>
			        <span class="bus-location">이태원 크라운호텔 건너편 육교</span>
			      </button>
			    </h2>
			    <div id="flush-collapse6" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the first item's accordion body.</div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse7" aria-expanded="false" aria-controls="flush-collapse7">
			        <span class="bus-time">08:05</span>
			        <span class="bus-location">반포쇼핑타운 8동 맞은편 GS주유소 가기전</span>
			      </button>
			    </h2>
			    <div id="flush-collapse7" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
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
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse8" aria-expanded="false" aria-controls="flush-collapse8">
			        <span class="bus-time">07:50</span>
			        <span class="bus-location">낙성육교(서현방향)</span>
			      </button>
			    </h2>
			    <div id="flush-collapse8" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the first item's accordion body.</div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse9" aria-expanded="false" aria-controls="flush-collapse9">
			        <span class="bus-time">07:58</span>
			        <span class="bus-location">서현역 공항버스정류장 50M 앞 육교아래(수내방향)</span>
			      </button>
			    </h2>
			    <div id="flush-collapse9" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the first item's accordion body.</div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse10" aria-expanded="false" aria-controls="flush-collapse10">
			        <span class="bus-time">08:05</span>
			        <span class="bus-location">정자역 3번출구(100M앞 파리바게뜨)</span>
			      </button>
			    </h2>
			    <div id="flush-collapse10" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the first item's accordion body.</div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse11" aria-expanded="false" aria-controls="flush-collapse11">
			        <span class="bus-time">08:15</span>
			        <span class="bus-location">동천역 2번 출구</span>
			      </button>
			    </h2>
			    <div id="flush-collapse11" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the first item's accordion body.</div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse12" aria-expanded="false" aria-controls="flush-collapse12">
			        <span class="bus-time">08:20</span>
			        <span class="bus-location">죽전역 1번출구 버스정류장</span>
			      </button>
			    </h2>
			    <div id="flush-collapse12" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the first item's accordion body.</div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse13" aria-expanded="false" aria-controls="flush-collapse13">
			        <span class="bus-time">08:35</span>
			        <span class="bus-location">동백이마트 정문 버스정류장</span>
			      </button>
			    </h2>
			    <div id="flush-collapse13" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the first item's accordion body.</div>
			    </div>
			  </div>
			</div>
			</div>
			
			<div class="bus-list-container">
			<h1>수원선</h1>
			<div class="accordion accordion-flush bus-list" id="accordionFlushExample">
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse14" aria-expanded="false" aria-controls="flush-collapse14">
			        <span class="bus-time">08:00</span>
			        <span class="bus-location">수원역 10번 출구 버스정류장</span>
			      </button>
			    </h2>
			    <div id="flush-collapse14" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the first item's accordion body.</div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse15" aria-expanded="false" aria-controls="flush-collapse15">
			        <span class="bus-time">08:08</span>
			        <span class="bus-location">동수원병원 건너편 버스정류장</span>
			      </button>
			    </h2>
			    <div id="flush-collapse15" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the second item's accordion body. Let's imagine this being filled with some actual content.</div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse16" aria-expanded="false" aria-controls="flush-collapse16">
			        <span class="bus-time">08:10</span>
			        <span class="bus-location">아주대 시외버스정류장 (맑은약국 앞)</span>
			      </button>
			    </h2>
			    <div id="flush-collapse16" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the third item's accordion body. Nothing more exciting happening here in terms of content, but just filling up the space to make it look, at least at first glance, a bit more representative of how this would look in a real-world application.</div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse17" aria-expanded="false" aria-controls="flush-collapse17">
			        <span class="bus-time">08:20</span>
			        <span class="bus-location">영통역 1번 출구 홈플러스 정문 앞</span>
			      </button>
			    </h2>
			    <div id="flush-collapse17" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the third item's accordion body. Nothing more exciting happening here in terms of content, but just filling up the space to make it look, at least at first glance, a bit more representative of how this would look in a real-world application.</div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse18" aria-expanded="false" aria-controls="flush-collapse18">
			        <span class="bus-time">08:35</span>
			        <span class="bus-location">수원 TG 두진 아파트 버스정류장</span>
			      </button>
			    </h2>
			    <div id="flush-collapse18" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the third item's accordion body. Nothing more exciting happening here in terms of content, but just filling up the space to make it look, at least at first glance, a bit more representative of how this would look in a real-world application.</div>
			    </div>
			  </div>
			</div>
			</div>
			
			<div class="bus-list-container">
			<h1>잠실선</h1>
			<div class="accordion accordion-flush bus-list" id="accordionFlushExample">
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse19" aria-expanded="false" aria-controls="flush-collapse19">
			        <span class="bus-time">07:50</span>
			        <span class="bus-location">건대 롯데백화점(스타시티몰)</span>
			      </button>
			    </h2>
			    <div id="flush-collapse19" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the first item's accordion body.</div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse20" aria-expanded="false" aria-controls="flush-collapse20">
			        <span class="bus-time">08:05</span>
			        <span class="bus-location">잠실롯데마트 정문 앞</span>
			      </button>
			    </h2>
			    <div id="flush-collapse20" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the second item's accordion body. Let's imagine this being filled with some actual content.</div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse21" aria-expanded="false" aria-controls="flush-collapse21">
			        <span class="bus-time">08:12</span>
			        <span class="bus-location">가락동 일신여상 정문 건너편 송파농협 앞</span>
			      </button>
			    </h2>
			    <div id="flush-collapse21" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the third item's accordion body. Nothing more exciting happening here in terms of content, but just filling up the space to make it look, at least at first glance, a bit more representative of how this would look in a real-world application.</div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse22" aria-expanded="false" aria-controls="flush-collapse22">
			        <span class="bus-time">08:30</span>
			        <span class="bus-location">성남 모란역 8번출구 앞</span>
			      </button>
			    </h2>
			    <div id="flush-collapse22" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the third item's accordion body. Nothing more exciting happening here in terms of content, but just filling up the space to make it look, at least at first glance, a bit more representative of how this would look in a real-world application.</div>
			    </div>
			  </div>
			</div>
			</div>
			
			<div class="bus-list-container">
			<h1>천안-평택선</h1>
			<div class="accordion accordion-flush bus-list" id="accordionFlushExample">
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse23" aria-expanded="false" aria-controls="flush-collapse23">
			        <span class="bus-time">07:30</span>
			        <span class="bus-location">천안종합운동장 앞</span>
			      </button>
			    </h2>
			    <div id="flush-collapse23" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the first item's accordion body.</div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse24" aria-expanded="false" aria-controls="flush-collapse24">
			        <span class="bus-time">07:40</span>
			        <span class="bus-location">천안 터미널사거리 아라리오 갤러리 앞</span>
			      </button>
			    </h2>
			    <div id="flush-collapse24" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the second item's accordion body. Let's imagine this being filled with some actual content.</div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse25" aria-expanded="false" aria-controls="flush-collapse25">
			        <span class="bus-time">08:05</span>
			        <span class="bus-location">천안 성환문화회관앞 사거리 성환게이트볼장 맞은편</span>
			      </button>
			    </h2>
			    <div id="flush-collapse25" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the third item's accordion body. Nothing more exciting happening here in terms of content, but just filling up the space to make it look, at least at first glance, a bit more representative of how this would look in a real-world application.</div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse26" aria-expanded="false" aria-controls="flush-collapse26">
			        <span class="bus-time">08:15</span>
			        <span class="bus-location">평택 뉴코아 아울렛 맞은편</span>
			      </button>
			    </h2>
			    <div id="flush-collapse26" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the third item's accordion body. Nothing more exciting happening here in terms of content, but just filling up the space to make it look, at least at first glance, a bit more representative of how this would look in a real-world application.</div>
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