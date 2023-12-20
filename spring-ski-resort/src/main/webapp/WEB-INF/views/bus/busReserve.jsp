<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이스키 버스 예약 페이지</title>
	<!-- Bootstrap 4 CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

    <!-- Bootstrap 4 JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <!-- Moment.js -->
    <script src="https://cdn.jsdelivr.net/npm/moment@2.29.1/moment.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/moment@2.29.1/locale/ko.js"></script> <!-- 한국어 locale 파일 추가 -->
	
    <!-- DateRangePicker CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/daterangepicker@3.1.0/daterangepicker.css" />


    <!-- DateRangePicker JS -->
    <script src="https://cdn.jsdelivr.net/npm/daterangepicker@3.1.0/daterangepicker.min.js"></script>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
	<link rel="stylesheet" href="/resources/css/bus/busReserve.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
	<jsp:include page="../common/nav.jsp" />
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
						<a href="/bus/busReserve">
							<button type="button" class="bus-btn mybus-btn">셔틀버스 예약</button>
						</a>
					</li>
					<li>
						<a href="/bus/busGuid">
							<button type="button" class="bus-btn mybus-btn">예약 안내</button>
						</a>
					</li>
					<li>
						<a href="/bus/busMap">
							<button type="button" class="bus-btn mybus-btn">노선 보기</button>
						</a>
					</li>
				</ul>
				
				
				<div class="busReserveContainer">
					<h3>버스 예약 선택</h3>
					<div class="busReserveBox">
						<div class="box">
							<form action="/bus/busReserve" method="post" id="busReserveForm">
								<div class="input-box">
									<input type="hidden" name="busNum" id="busNum" placeholder="차량번호">
									<input type="hidden" name="memberNum" value="${mvo.memberNum }" placeholder="회원번호">
									<input type="hidden" name="busStartDate" id="busStartDate" placeholder="버스이용날짜">
									<input type="hidden" name="busRegion" id="busRegion" placeholder="출발지역">
									<input type="hidden" name="busPeople" id="busPeople" placeholder="인원수">
									<div class="date-group">
										<div class="input-group calendar">
						              	 	<div class="input-group-prepend">
						                		 <span class="input-group-text"><i class="bi bi-calendar"></i></span>
						                	</div>
											<input type="text" class="form-control" id="dateRangePicker" placeholder="날짜를 선택하세요" readonly="readonly">
										</div>
									</div>
									
									<div class="input-box1">
										<div class="input-group mb-3">
											<span class="input-group-text" id="basic-addon1"><i class="bi bi-person-fill"></i></span>
											<input type="text" id="people" class="form-control people" placeholder="인원수" aria-label="Username" readonly="readonly" aria-describedby="basic-addon1" onclick="addAudltCnt(0)">
										</div>
										<div class="peopleList"  id="peopleList" style="display: none;">
						  					<div class="list-Btn-Box">
						  						예약인원 
						  						<div class="people-Btn"> 
							  						<div>
							  							<button type="button" onclick="addAudltCnt(-1)">
							  								<svg style="width: 14px; height: 14px; xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M20.25 12.75H3.75a.75.75 0 0 1 0-1.5h16.5a.75.75 0 0 1 0 1.5z"></path></svg>
							  							</button>
							  						</div> 	 
							  						<div id="adult-Count">
							  							1
							  						</div> 
							  						
							  						<div>
							  							<button type="button" onclick="addAudltCnt(1)">
							  							<svg style="width: 14px; height: 14px; xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M20.25 11.25h-7.5v-7.5a.75.75 0 0 0-1.5 0v7.5h-7.5a.75.75 0 0 0 0 1.5h7.5v7.5a.75.75 0 0 0 1.5 0v-7.5h7.5a.75.75 0 0 0 0-1.5z"></path></svg>
							  							</button>
							  						</div> 
						  						</div> 
						  					</div>
						  					
					  						<div>
					  							<button id="peoplelistClose" type="button" class="btn btn-outline-primary">닫기</button>
					  						</div>
					  					
					  					</div>
									</div>	
									<div class="regionBox">
										<div class="input-group mb-3">
											<span class="input-group-text" id="basic-addon1"><i class="bi bi-geo-alt-fill"></i></span>
											<select class="form-select" id="selectBusRegion" onclick="updateRegion()" aria-label="Default select example">
											  <option selected>지역선택</option>
											  <option value="강남선">강남선</option>
											  <option value="광화문">광화문</option>
											  <option value="분당선">분당선</option>
											  <option value="수원선">수원선</option>
											  <option value="잠실선">잠실선</option>
											  <option value="천안-평택선">천안-평택선</option>
											</select>
										</div>
									</div>
								</div>
								<div class="regionImgBox" id="regionImgBox">
									 <img src="https://rusutsu.com/wp-content/uploads/rusutsu-powder-day-trip_sp.jpg" alt="지역 이미지" id="regionImage" class="img-fluid" style="width: 100%; height: 100%;">
								</div>
								<button type="button" class="btn btn-outline-primary busReserveBtn" id="busReserveBtn">예약</button>	
							</form>
						</div>
					</div>
				</div>
				
		    </div>
		  </div>
		</div>
	</div>






	<script type="text/javascript">
	const memberEmail= `<c:out value="${mvo.memberEmail}"/>`;
	</script>
	<script type="text/javascript" src="/resources/js/bus/busReserve.js"></script>
	<jsp:include page="../common/footer.jsp" />	
</body>
</html>