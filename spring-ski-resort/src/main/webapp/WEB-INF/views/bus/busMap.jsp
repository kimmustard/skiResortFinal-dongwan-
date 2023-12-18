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
					<a>
						<button type="button" class="bus-btn mybus-btn">노선 보기</button>
					</a>
				</li>
			</ul>
	    </div>







	  </div>
	</div>
</div>

<jsp:include page="../common/footer.jsp" />	
</body>
</html>