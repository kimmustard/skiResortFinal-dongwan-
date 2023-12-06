<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/hotel/addRoom.css">
<jsp:include page="../common/nav.jsp"></jsp:include>
</head>
<body>
	<form action="/hotel/addRoom" method="post">
	<div class="main-box">

	<div class="div">
		<input class="input" type="text" name="hotelRoomName" required>
		<label class="label">방이름</label>
	    <span class="span"></span>
	</div>
	
	<div class="div">
		<input class="input" type="text" name="hotelRoomExplain" required>
		<label class="label">방설명</label>
	    <span class="span"></span>
	</div >
	<div class="div">
		<input class="input" type="number" name="hotelRoomStandardPeople" required>
		<label class="label">기준인원</label>
	    <span class="span"></span>
	</div>
	<div class="div">
		<input class="input" type="text" name="hotelRoomType" required>
		<label class="label">방종류</label>
	    <span class="span"></span>
	</div>
	<div class="div">
		<input class="input" type="text" name="hotelRoomArea" required>
		<label class="label">방면적</label>
	    <span class="span"></span>
	</div>
	<div class="div">
		<input class="input" type="number" name="hotelRoomFee" required>
		<label class="label">방요금</label>
	    <span class="span"></span>
	</div>
	<div class="div">
		<input class="input" type="number" name="hotelRoomCount" required>
		<label class="label">객실수</label>
	    <span class="span"></span>
	</div>
	<div class="div btn-group" role="group" aria-label="Basic example">
		<button type="button" class="btn btn-danger">뒤로가기</button>
		<button type="submit" class="btn btn-success">추가하기</button>
	</div>
	</div>
	</form>
</body>
</html>