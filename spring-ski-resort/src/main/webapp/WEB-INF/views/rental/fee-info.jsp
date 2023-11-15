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
	
	.rentalTableContainer, .liftTableContainer{
		margin: 120px auto;
		width: 700px;
	}
	
	.btnContainer{
		display: flex;
		justify-content: center;
	}
	
	.btn-outline-info{
		margin-left: 20px;
		margin-right: 20px;
	}
</style>
</head>
<body>
	<jsp:include page="../common/nav.jsp" />


	<div class="bodyContainer">
	
		<div class="rentalTableContainer">
			<h1 class="h1">렌탈/요금안내</h1>
			<table class="table table-info table-striped">
				<thead>
					<tr>
						<th>#</th>
						<th>일반장비set</th>
						<th>중급장비set</th>
						<th>프리미엄장비set</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>오전</th>
						<th>대인20000 | 소인 10000</th>
						<th>대인25000 | 소인 15000</th>
						<th>대인30000 | 소인 20000</th>
					</tr>
					<tr>
						<th>오후</th>
						<th>대인25000 | 소인 15000</th>
						<th>대인30000 | 소인 20000</th>
						<th>대인35000 | 소인 25000</th>
					</tr>
					<tr>
						<th>종일</th>
						<th>대인35000 | 소인 25000</th>
						<th>대인40000 | 소인 30000</th>
						<th>대인45000 | 소인 35000</th>
					</tr>
				</tbody>
			</table>

		</div>
		
		<div class="liftTableContainer">
			<h1 class="h1">리프트권 요금</h1>
			<table class="table table-info table-striped">
				<thead>
					<tr>
						<th>#</th>
						<th>평일</th>
						<th>주말/공휴일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>오전</th>
						<th>대인 40000 | 소인 25000</th>
						<th>대인 45000 | 소인 30000</th>
					</tr>
					<tr>
						<th>오후</th>
						<th>대인 50000 | 소인 35000</th>
						<th>대인 55000 | 소인 40000</th>
					</tr>
					<tr>
						<th>종일</th>
						<th>대인 65000 | 소인 50000</th>
						<th>대인 70000 | 소인 55000</th>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="btnContainer">
			<a href="/rental/item"><button type="button" class="btn btn-outline-info">장비안내</button></a>
			<a href="/rental/reserve"><button type="button" class="btn btn-outline-info">예약페이지</button></a>
		</div>
	
	</div>

</body>
</html>