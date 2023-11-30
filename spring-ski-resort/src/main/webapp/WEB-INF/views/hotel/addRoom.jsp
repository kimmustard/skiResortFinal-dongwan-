<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/hotel/addRoom" method="post">
	<div>
		<input type="text" name="hotelRoomName">방이름
		 <textarea rows="3" cols="30" name="hotelRoomExplain"></textarea> 방설명
		<input type="number" name="hotelRoomStandardPeople">기준인원
		<input type="text" name="hotelRoomType">방종류
		<input type="text" name="hotelRoomArea">방면적
		<input type="number" name="hotelRoomFee">방요금
		<input type="number" name="hotelRoomCount">객실수
		<button type="button">뒤로가기</button>
		<button type="submit">추가하기</button>
	</div>
	</form>
</body>
</html>