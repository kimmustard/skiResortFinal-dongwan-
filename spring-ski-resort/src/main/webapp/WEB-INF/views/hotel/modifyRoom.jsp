<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<c:forEach var="room" items="${roomList}">
			<li>
				
					방이름<input type="text" name="hotelRoomName" value="${room.hotelRoomName}">
					방설명<textarea rows="3" cols="30" name="hotelRoomExplain" >${room.hotelRoomExplain}</textarea> 
					기준인원<input type="number" name="hotelRoomStandardPeople" value="${room.hotelRoomStandardPeople}">
					방종류<input type="text" name="hotelRoomType" value="${room.hotelRoomType}">
					방면적<input type="text" name="hotelRoomArea" value="${room.hotelRoomArea}">
					방요금<input type="number" name="hotelRoomFee" value="${room.hotelRoomFee}">
					객실수<input type="number" name="hotelRoomCounts" value="${room.hotelRoomCount}">
					<a href="/hotel/deleteRoom?hotelRoomNum=${room.hotelRoomNum}">삭제</a>
					
					<a href="/hotel/modifyRoom?hotelRoomNum=${room.hotelRoomNum}">수정</a>
			</li>
		</c:forEach>
	</ul>
</body>
</html>