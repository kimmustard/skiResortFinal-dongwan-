<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이스키 버스예약 안내</title>
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


			<div class="bus-guid-container">
			<h1>예약 날짜 선택</h1>
			<div class="bus-guid-p">
				<p>온라인 셔틀 예약은 다이스키 리조트 회원에 한해서 이용하실 수 있습니다.</p>
				<p>셔틀버스 예약은 당일 왕복에 한하며, 편도 예약은 불가능합니다.<br>(리조트에서 출발하는 차편을 이용하지 않으시면 당일 예약이 자동 취소되므로, 리조트에서 출발하는 차편을 이용하실 수 없습니다.)</p>
				<p>다이스키 리조트에서 출발하는 차량이용을 원하시는 고객은 셔틀사무실을 통해 잔여좌석 확인 후 이용해 주십시오.</p>
				<p>셔틀버스는 다이스키 홈페이지에서만 예약이 가능하며, 예약하지 아니한 경우는 이용이 불가 합니다.</p>
				<p>위약률이 높거나, 이용자가 적을 시 해당 노선을 유료로 전환하거나 폐지할 수 있습니다.</p>
				<p>과도한 도로정체가 예상되는 신정연휴기간 야간노선 및 장거리 노선은 운행하지 않을 수 있습니다.</p>
				<p>천재지변이나 도로교통 상황에 따라 시간이 변동되거나 운행이 취소될 수 있습니다.</p>
			</div>
			
			<h1>무료셔틀예약/취소 마감시간 안내</h1>
			<div class="bus-guid-table-container1">
				<table class="table bus-guid-table1">
				  <thead>
				    <tr>
				      <th>이용노선</th>
				      <th style="border-left: 1px solid #bcbcbc; border-right: 1px solid #bcbcbc;">전노선</th>
				      <th>강남선(야간, 야심)</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <td>예약취소마감</td>
				      <td style="border-left: 1px solid #bcbcbc; border-right: 1px solid #bcbcbc;">전일 18시</td>
				      <td>당일 정오(12시)</td>
				    </tr>			 
				  </tbody>
				</table>
			</div>
			
			
			
			
			
			</div>
		</div>
	  </div>
	</div>
</div>
<jsp:include page="../common/footer.jsp" />	
</body>
</html>