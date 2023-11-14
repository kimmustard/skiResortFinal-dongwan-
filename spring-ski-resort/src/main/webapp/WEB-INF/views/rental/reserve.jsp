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
	
	
</style>
</head>
<body>
	<jsp:include page="../common/nav.jsp" />

	
	<div class="formContainer">
		<form action="/rental/reserve" method="post">
			<div class="input-group mb-3">
				<span class="input-group-text">회원번호</span>
				<input type="text" class="form-control" name="memberNum">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">이름</span>
				<input type="text" class="form-control" name="memberName">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">전화번호</span>
				<input type="text" class="form-control" name="memberPhoneNum">
			</div>
		</form>
	</div>
</body>
</html>