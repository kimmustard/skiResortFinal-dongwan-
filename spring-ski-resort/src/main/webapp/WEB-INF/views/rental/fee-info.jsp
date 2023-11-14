<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>렌탈/요금안내</title>
<style type="text/css">
	.bodyContainer{
		width: 100%;
		height: 1500px;
	}
	
	h1{
		margin: 150px;
		text-align: center;
	}
	
	.tableContainer, .btnContainer{
		margin: 150px;
		display: flex;
		justify-content: center;
	}
</style>
</head>
<body>
	<jsp:include page="../common/nav.jsp" />


	<div class="bodyContainer">
	
		<h1>렌탈/요금안내</h1>
		<div class="tableContainer">
			<table border="1">
				<tr>
					<th>#</th>
					<th>스키/보드</th>
					<th>헬멧/고글/보호대</th>
					<th>의류Set</th>
				</tr>
				<tr>
					<th>4시간권</th>
					<th>15000</th>
					<th>10000</th>
					<th>10000</th>
				</tr>
				<tr>
					<th>6시간권</th>
					<th>20000</th>
					<th>15000</th>
					<th>15000</th>
				</tr>
				<tr>
					<th>종일권</th>
					<th>30000</th>
					<th>20000</th>
					<th>20000</th>
				</tr>
			</table>
			<div class="btnContainer">
				<a href="/rental/item"><button type="button">장비안내</button></a>
				<a href="/rental/reserve"><button type="button">예약페이지</button></a>
			</div>
		</div>
	
	</div>
	
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>