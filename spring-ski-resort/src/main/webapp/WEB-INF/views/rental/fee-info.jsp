<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>렌탈/요금안내</title>
<link rel="stylesheet" href="/resources/css/rental/fee_info.css">
</head>
<body>
	<jsp:include page="../common/nav.jsp" />

	
<div class="bodyContainer">
		<div class="bodyBackgroundImg1">
		
		</div>
		
		<div class="mainContainer">
		
		
		<div class="liftTableContainer">
		<div class="main-logo1">
			<img width="280" height="250" alt="" src="/resources/etc/logo_white.png">
		</div>
		
		
		
		<!-- <h1 class="lift-Title">리프트</h1>
			<table class="table">
				<thead class="thead">
					<tr class="liftTr">
						<td class="liftTd" rowspan="2">#</td>
						<td class="liftTd" rowspan="2">시간</td>
						<td class="liftTd" colspan="2">요금</td>
					</tr>
					<tr class="liftTr">
						<td class="liftTd">소인</td>
						<td class="liftTd">대인</td>
					</tr>
				</thead>
				<tbody>
					<tr class="liftTr">
						<td class="liftTd" rowspan="6">리프트권</td>
						<td class="liftTd">오전</td>
						<td class="liftTd">30,000</td>
						<td class="liftTd">40,000</td>
					</tr>
					<tr class="liftTr">
						<td class="liftTd">오후</td>
						<td class="liftTd">40,000</td>
						<td class="liftTd">50,000</td>
					</tr>
					<tr class="liftTr">
						<td class="liftTd">주간</td>
						<td class="liftTd">50,000</td>
						<td class="liftTd">60,000</td>
					</tr>
					<tr class="liftTr">
						<td class="liftTd">야간</td>
						<td class="liftTd">30,000</td>
						<td class="liftTd">40,000</td>
					</tr>
					<tr class="liftTr">
						<td class="liftTd">종일</td>
						<td class="liftTd">65,000</td>
						<td class="liftTd">75,000</td>
					</tr>
					<tr class="liftTr">
						<td class="liftTd">시즌</td>
						<td class="liftTd">350,000</td>
						<td class="liftTd">380,000</td>
					</tr>
				</tbody>
			</table>-->
		</div> 
		
		
		<div class="rentalTableContainer">
		
		<!-- <h1 class="lift-Title">렌탈</h1>
			<table class="table">
				<thead class="thead">
					<tr class="rentalTr">
						<td class="rentalTd" colspan="2" rowspan="2">구분</td>
						<td class="rentalTd" colspan="9">렌탈요금</td>
					</tr>
					<tr class="rentalTr">
						<td class="rentalTd">스키장비SET(일반)</td>
						<td class="rentalTd">스키장비SET(중급)</td>
						<td class="rentalTd">스키장비SET(프리미엄)</td>
						<td class="rentalTd">보드장비SET(일반)</td>
						<td class="rentalTd">보드장비SET(중급)</td>
						<td class="rentalTd">보드장비SET(프리미엄)</td>
						<td class="rentalTd">의류/보호장비(일반)</td>
						<td class="rentalTd">의류/보호장비(중급)</td>
						<td class="rentalTd">의류/보호장비(프리미엄)</td>
					</tr>
				</thead>
				<tbody>
					<tr class="rentalTr">
						
						<td class="rentalTd" colspan="2">소인</td>
						<td class="rentalTd">20,000</td>
						<td class="rentalTd">30,000</td>
						<td class="rentalTd">40,000</td>
						<td class="rentalTd">20,000</td>
						<td class="rentalTd">30,000</td>
						<td class="rentalTd">40,000</td>
						<td class="rentalTd" rowspan="2">15,000</td>
						<td class="rentalTd" rowspan="2">25,000</td>
						<td class="rentalTd" rowspan="2">35,000</td>
					</tr>
					<tr class="rentalTr">
						<td class="rentalTd" colspan="2">대인</td>
						<td class="rentalTd">30,000</td>
						<td class="rentalTd">40,000</td>
						<td class="rentalTd">50,000</td>
						<td class="rentalTd">30,000</td>
						<td class="rentalTd">40,000</td>
						<td class="rentalTd">50,000</td>
						
						
					</tr>
					
				</tbody>
			</table> -->
		</div>
		
		
		<!-- <div class="textContainer">
			<p>※소인(~ 만 13세) , 대인(만 14세 ~)</p> <br>
			<p>※오전(09:00 ~ 13:00) , 오후(13:00 ~ 19:00) , 주간(09:00 ~ 17:00) , 야간(17:00 ~ 22:00)</p>
		</div>
		-->
		
		
		<div class="btnContainer">
			<a href="/rental/item"><button type="button" class="btn btn-outline-info">장비안내</button></a>
			<a href="/rental/reserve"><button type="button" class="btn btn-outline-info">예약페이지</button></a>
		</div> 
	</div>
</div>
	
	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>