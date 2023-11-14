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
		margin: 150px;
		text-align: center;
		font-weight: 700;
		font-size: 35px;
	}
	
	.tableContainer, .btnContainer{
		margin: 150px;
		display: flex;
		justify-content: center;
	}
	
	.rental-table{
		background-color: red;
	}
</style>
</head>
<body>
	<jsp:include page="../common/nav.jsp" />


	<div class="bodyContainer">
	
		<h1 class="h1">렌탈/요금안내</h1>
		<div class="tableContainer">
			<div class="rental-table">
				<div class="rental-thead">
					
				</div>
			</div>
			
			
			<div class="btnContainer">
				<a href="/rental/item"><button type="button">장비안내</button></a>
				<a href="/rental/reserve"><button type="button">예약페이지</button></a>
			</div>
		</div>
	
	</div>

</body>
</html>