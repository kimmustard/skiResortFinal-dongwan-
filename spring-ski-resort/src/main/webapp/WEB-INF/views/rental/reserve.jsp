<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 페이지</title>
</head>
<body>
	<h1>예약</h1>
	
	<div class="formContainer">
		<form action="/rental/reserve" method="post">
			<div>
				<label>회원번호</label>
				<input type="text" name="memberNum">
			</div>
			<div>
				<label>이름</label>
				<input type="text" name="memberName">
			</div>
			<div>
				<label>전화번호</label>
				<input type="text" name="memberPhoneNum">
			</div>
		</form>
	</div>
</body>
</html>