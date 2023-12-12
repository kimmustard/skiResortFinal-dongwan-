<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장비 렌탈 페이지</title>
<link rel="stylesheet" href="/resources/css/rental/item_reserve.css">
</head>
<body>
	<jsp:include page="../common/nav.jsp" />
	
	<div class="bodyContainer">
	
		<div class="reserveContainer">
			<div class="reserveBox">
				<form action="/rental/item-reserve">
					<div class="input-group mb-3">
						<span class="input-group-text">리프트권종류</span>
						<input type="text" class="form-control" name="rentalLiftTicket" id="LiftTicket" value="${rlivo.rentalLiftTicket }" readonly="readonly">
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text">이용날짜</span>
						<input type="text" class="form-control" name="rentalLiftStart" id="LiftStart" value="${rlivo.rentalLiftStart }" readonly="readonly">
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text">상품명</span>
						<input type="text" class="form-control" name="rentalItemName" id="rentalItemName" readonly="readonly">
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text">성인요금</span>
						<input type="text" class="form-control" name="rentalReserveAdultFee" id="rentalReserveKidFee" readonly="readonly">
						<span class="input-group-text">어린이요금</span>
						<input type="text" class="form-control" name="rentalReserveAdultFee" id="rentalReserveKidFee" readonly="readonly">
					</div>
					<a href="/rental/ski-item"><button type="button" class="btn btn-outline-primary">이전으로</button></a>
					<button type="submit" class="btn btn-outline-primary">결제</button>
				</form>
			</div>
		</div>
	
	</div>
	
	
	
	<script type="text/javascript" src="/resources/js/rental/item.js"></script>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>