<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 페이지</title>
<style type="text/css">
	
	.formContainer{
		margin-top: 120px;
		display: flex;
		justify-content: center;
	}
	
	.formContainer form {
		margin: auto;
		width: 600px;
		
	}

	.formContainer form div {
		margin-bottom: 20px;
	}
</style>
</head>
<body>
	<jsp:include page="../common/nav.jsp" />

	
	<div class="formContainer">
		<form action="/rental/reserve" method="post">
			<div class="input-group mb-3">
				<span class="input-group-text">이름</span>
				<input type="text" class="form-control" name="memberName">
			</div>
			<div>
				<select class="form-select">
				  <option selected>리프트권 선택</option>
				  <option value="1">리프트 오전권</option>
				  <option value="2">리프트 오후권</option>
				  <option value="3">리프트 주간권</option>
				  <option value="4">리프트 야간권</option>
				  <option value="5">리프트 종일권</option>
				  <option value="6">리프트 시즌권</option>
				</select>
			</div>
			<div>
				<select class="form-select">
				  <option selected>장비 선택</option>
				  <option value="item1">일반장비SET</option>
				  <option value="item2">중급장비SET</option>
				  <option value="item3">프리미엄장비SET</option>
				</select>
			</div>
			<div>
				<select class="form-select">
				  <option selected>시간 선택</option>
				  <option value="1">렌탈 오전권</option>
				  <option value="2">렌탈 오후권</option>
				  <option value="3">렌탈 주간권</option>
				  <option value="4">렌탈 야간권</option>
				  <option value="5">렌탈 종일권</option>
				  <option value="6">렌탈 시즌권</option>
				</select>
			</div>
			<a href="/rental/fee-info"><button type="button" class="btn btn-outline-primary">이전으로</button></a>
			<button type="submit" class="btn btn-outline-primary">예약완료</button>
		</form>
	</div>
	
	
</body>
</html>