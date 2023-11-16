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
		width: 800px;
	}
	
	.btnContainer{
		display: flex;
		justify-content: center;
	}
	
	.btn-outline-info{
		margin-left: 20px;
		margin-right: 20px;
	}
	
	.rentalDivContainer{
		width: 800px;
		display: flex;
		flex-wrap: wrap;
		justify-content: center;
		margin-left: 550px;
	}
	
	.rentaltableBox1,.rentaltableBox2,
	.rentaltableBox3,.rentaltableBox4{
		width: 25%;
		height: 50px;
		border: 1px solid black;
	}
	
	p{
		text-align: center;
		font-weight: 700;
		line-height: 50px;
	}
</style>
</head>
<body>
	<jsp:include page="../common/nav.jsp" />


	<div class="bodyContainer">
	
		
		
		<h1 class="h1">렌탈/요금안내</h1>
		
		<div class="rentalDivContainer">
			<div class="rentaltableBox1">
				<div>
					<p>#</p>
				</div>
			</div>
			<div class="rentaltableBox2">
				<div>
					<p>일반장비set</p>
				</div>
			</div>
			<div class="rentaltableBox3">
				<div>
					<p>중급장비set</p>
				</div>
			</div>
			<div class="rentaltableBox4">
				<div>
					<p>프리미엄장비set</p>
				</div>
			</div>
			<div class="rentaltableBox1">
				<div>
					<p>오전(08:00 ~ 12:00)</p>
				</div>
			</div>
			<div class="rentaltableBox2">
				<div>
					<p>대인20000 | 소인 10000</p>
				</div>
			</div>
			<div class="rentaltableBox3">
				<div>
					<p>대인25000 | 소인 15000</p>
				</div>
			</div>
			<div class="rentaltableBox4">
				<div>
					<p>대인30000 | 소인 20000</p>
				</div>
			</div>
			<div class="rentaltableBox1">
				<div>
					<p>오후(12:00 ~ 18:00)</p>
				</div>
			</div>
			<div class="rentaltableBox2">
				<div>
					<p>대인25000 | 소인 15000</p>
				</div>
			</div>
			<div class="rentaltableBox3">
				<div>
					<p>대인30000 | 소인 20000</p>
				</div>
			</div>
			<div class="rentaltableBox4">
				<div>
					<p>대인35000 | 소인 25000</p>
				</div>
			</div>
			<div class="rentaltableBox1">
				<div>
					<p>야간(18:00 ~ 22:00)</p>
				</div>
			</div>
			<div class="rentaltableBox2">
				<div>
					<p>대인20000 | 소인 10000</p>
				</div>
			</div>
			<div class="rentaltableBox3">
				<div>
					<p>대인25000 | 소인 15000</p>
				</div>
			</div>
			<div class="rentaltableBox4">
				<div>
					<p>대인30000 | 소인 20000</p>
				</div>
			</div>
			<div class="rentaltableBox1">
				<div>
					<p>종일(08:00 ~ 22:00)</p>
				</div>
			</div>
			<div class="rentaltableBox2">
				<div>
					<p>대인40000 | 소인 30000</p>
				</div>
			</div>
			<div class="rentaltableBox3">
				<div>
					<p>대인45000 | 소인 35000</p>
				</div>
			</div>
			<div class="rentaltableBox4">
				<div>
					<p>대인50000 | 소인 40000</p>
				</div>
			</div>
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
						<th>오전(08:00 ~ 12:00)</th>
						<th>대인 40000 | 소인 25000</th>
						<th>대인 45000 | 소인 30000</th>
					</tr>
					<tr>
						<th>오후(12:00 ~ 18:00)</th>
						<th>대인 50000 | 소인 35000</th>
						<th>대인 55000 | 소인 40000</th>
					</tr>
					<tr>
						<th>야간(18:00 ~ 22:00)</th>
						<th>대인 40000 | 소인 25000</th>
						<th>대인 45000 | 소인 30000</th>
					</tr>
					<tr>
						<th>종일(08:00 ~ 22:00)</th>
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
	
	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>