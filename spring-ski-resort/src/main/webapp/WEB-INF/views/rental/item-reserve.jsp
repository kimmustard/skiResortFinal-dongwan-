<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
					<input type="text" class="form-control" name="rentalLiftNum" readonly="readonly" value="${rlivo.rentalLiftNum }" placeholder="리프트권 일련번호">
					<div class="input-group mb-3">
						<span class="input-group-text">이용날짜</span>
						<input type="text" class="form-control" name="rentalReserveStart" id="rentalStart" value="${rlivo.rentalLiftStart }" readonly="readonly">
					</div>
					<div class="people">
						<div class="input-group mb-3">
							<span class="input-group-text">인원수(성인)</span>
							<input type="text" class="form-control" name="rentalReserveAdult" id="rentalReserveAdult" value="${rlivo.rentalLiftAdult }" readonly="readonly">
						</div>
						<div class="input-group mb-3">
							<span class="input-group-text">인원수(어린이)</span>
							<input type="text" class="form-control" name="rentalReserveKid" id="rentalReserveKid" value="${rlivo.rentalLiftKid }" readonly="readonly">
						</div>
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text">상품명</span>
						<input type="text" class="form-control" name="rentalReserveItem" id="rentalReserveItem" readonly="readonly">
					</div>
					<div class="fee">
						<div class="input-group mb-3">
							<span class="input-group-text">성인요금</span>
							<input type="text" class="form-control" name="rentalReserveAdultFee" id="rentalReserveAdultFee" value="${ritvo.rentalListItemAdultFee }" readonly="readonly">
						</div>
						<div class="input-group mb-3">
							<span class="input-group-text">어린이요금</span>
							<input type="text" class="form-control" name="rentalReserveKidFee" id="rentalReserveKidFee" value="${ritvo.rentalListItemKidFee }" readonly="readonly">
						</div>
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text">총 요금</span>
						<input type="text" class="form-control" name="rentalReserveTotalFee" id="rentalReserveTotalFee" readonly="readonly">
					</div>
					<div class="input-group mb-3">
						<label class="form-check-label" for="flexRadioDefault2">반납서비스 이용</label>
					</div>
					<div class="form-check">
					  	<input class="form-check-input" type="radio" name="rentalReserveIsreturn" id="yesCheck" value="Y">
					  	<label class="form-check-label" for="flexRadioDefault1">
					    예
					  	</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="rentalReserveIsreturn" id="noCheck" value="N">
						<label class="form-check-label" for="flexRadioDefault1">
						아니오
						</label>
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