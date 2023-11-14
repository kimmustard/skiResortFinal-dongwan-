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
	
	.tableContainer{
		width: 700px;
		height: 300px;
		margin-top: 150px;
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
	
		<h1 class="h1">렌탈/요금안내</h1>
		<div class="tableContainer">
			<table class="table table-success table-striped">
				<thead>
					<tr>
						<th>#</th>
						<th>스키/보드</th>
						<th>헬멧/보호대</th>
						<th>의류</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>4시간권</th>
						<th>15000</th>
						<th>10000</th>
						<th>15000</th>
					</tr>
					<tr>
						<th>6시간권</th>
						<th>20000</th>
						<th>15000</th>
						<th>20000</th>
					</tr>
					<tr>
						<th>종일권</th>
						<th>30000</th>
						<th>25000</th>
						<th>30000</th>
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