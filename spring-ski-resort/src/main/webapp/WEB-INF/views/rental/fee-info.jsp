<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>렌탈/요금안내</title>
<style type="text/css">
	.bodyContainer1{
		width: 100%;
		height: 1500px;
	}
	
	.h1{
		text-align: center;
	}

	.btnContainer{
		display: flex;
		justify-content: center;
		margin-top: 50px;
	}
	
	.btn-outline-info{
		margin-left: 20px;
		margin-right: 20px;
	}
	
	.liftTableContainer{
		width: 1000px;
		border-collapse: collapse;
		margin: 0 auto;
	}
	
	.tr, .td{
	 	border: 2px solid black;
	 	text-align: center;
	 	font-weight: 700;
	 }
	 
	 .td{
	 	vertical-align: middle;
	 }

	
</style>
</head>
<body>
	<jsp:include page="../common/nav.jsp" />


	<div class="bodyContainer">
	
		
		
		<h1 class="h1" style="margin-top: 50px;">리프트권 요금</h1>
		
		<div class="liftTableContainer">
			<table class="table">
				<thead class="thead">
					<tr class="tr">
						<td class="td" rowspan="2">#</td>
						<td class="td" rowspan="2">시간</td>
						<td class="td" colspan="2">요금</td>
					</tr>
					<tr class="tr">
						<td class="td">소인</td>
						<td class="td">대인</td>
					</tr>
				</thead>
				<tbody>
					<tr class="tr">
						<td class="td" rowspan="6">리프트권</td>
						<td class="td">오전</td>
						<td class="td">30,000</td>
						<td class="td">40,000</td>
					</tr>
					<tr class="tr">
						<td class="td">오후</td>
						<td class="td">40,000</td>
						<td class="td">50,000</td>
					</tr>
					<tr class="tr">
						<td class="td">주간</td>
						<td class="td">50,000</td>
						<td class="td">60,000</td>
					</tr>
					<tr class="tr">
						<td class="td">야간</td>
						<td class="td">30,000</td>
						<td class="td">40,000</td>
					</tr>
					<tr class="tr">
						<td class="td">종일</td>
						<td class="td">65,000</td>
						<td class="td">75,000</td>
					</tr>
					<tr class="tr">
						<td class="td">시즌</td>
						<td class="td">350,000</td>
						<td class="td">380,000</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<h1 class="h1" style="margin-top: 50px;">렌탈/요금안내</h1>
		
		<div class="rentalTableContainer">
			
		</div>
		
		
		
		<div class="btnContainer">
			<a href="/rental/item"><button type="button" class="btn btn-outline-info">장비안내</button></a>
			<a href="/rental/reserve"><button type="button" class="btn btn-outline-info">예약페이지</button></a>
		</div>
	
	</div>
	
	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>