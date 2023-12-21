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
					<a href="/bus/busReserve">
						<button type="button" class="bus-btn mybus-btn">셔틀버스 예약</button>
					</a>
				</li>
				<li>
					<a href="/bus/busGuid">
						<button type="button" class="bus-btn mybus-btn" style="background-color: #222222; color: white;">예약 안내</button>
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
			<div class="bus-guid-table-container">
				<table class="table bus-guid-table">
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
			<div class="bus-guid-p">
				<p>마감시간이 지나면 예약이 불가합니다. (전화예약 불가)</p>
				<p>운행 노선 및 운행사는 매 시즌마다 변경될 수 있습니다.</p>
			</div>
			
			<h1>노선별 운행일정 안내</h1>
			<div class="bus-guid-table-container">
				<table class="table bus-guid-table">
				  <thead>
				    <tr>
				      <th>노선</th>
				      <th style="border-left: 1px solid #bcbcbc; border-right: 1px solid #bcbcbc;">운행일</th>
				      <th>운행종료일</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <td>강남선</td>
				      <td rowspan="7" style="border-left: 1px solid #bcbcbc; border-right: 1px solid #bcbcbc;"><div>오픈후 익일부터</div></td>
				      <td rowspan="8"><div>2024년 2월 21일</div></td>
				    </tr>			 			 
				    <tr>
				      <td>천안평택</td>
				    </tr>			 
				    <tr>
				      <td>광화문</td>
				    </tr>			 
				    <tr>
				      <td>잠실선</td>
				    </tr>			 
				    <tr>
				      <td>분당, 수지</td>
				    </tr>			 
				    <tr>
				      <td>수원선</td>
				    </tr>			 
				    <tr>
				      <td>강남선(야간)</td>
				    </tr>			 
				    <tr>
				      <td>강남선(심야)</td>
				      <td style="border-left: 1px solid #bcbcbc; border-right: 1px solid #bcbcbc;">심야 운영일부터</td>
				    </tr>			 
				  </tbody>
				</table>
			</div>
			<div class="bus-guid-p">
				<p>상황에 따라 탑승장 및 운행시간이 다소 변동 될수 있습니다</p>
				<p>셔틀버스 안내 사무실 Tel. 033-123-5678, 운영시간 07 : 00 ~ 19 : 00 (19시 이후 심야안내는 종합안내실에서 운영)</p>
				<p>인터넷 예약 및 현장 예약 가능 (귀가차량 현장예약시 잔여좌석에 한함)</p>
				<p>셔틀버스 안내는 아래 노선별 담당으로 문의</p>
				<p>강남/분당/수원/천안평택 노선 : ㈜다이스키 여행사(카카오톡 아이디 : 다이스키 여행사 검색)</p>
				<p>광화문/잠실 노선 : 이젠버스관광(02-232-0101)</p>
			</div>
			
			
			</div>
		</div>
	  </div>
	</div>
</div>
<jsp:include page="../common/footer.jsp" />	
</body>
</html>