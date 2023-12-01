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
				<form action="/hotel/modifyRoom" method="post">
				
					방번호 <input type="text" name="hotelRoomNum" value="${room.hotelRoomNum}" readonly="readonly">
					방이름<input type="text" name="hotelRoomName" value="${room.hotelRoomName}">
					방설명<textarea rows="3" cols="30" name="hotelRoomExplain" >${room.hotelRoomExplain}</textarea> 
					기준인원<input type="number" name="hotelRoomStandardPeople" value="${room.hotelRoomStandardPeople}">
					방종류<input type="text" name="hotelRoomType" value="${room.hotelRoomType}">
					방면적<input type="text" name="hotelRoomArea" value="${room.hotelRoomArea}">
					방요금<input type="number" name="hotelRoomFee" value="${room.hotelRoomFee}">
					객실수<input type="number" name="hotelRoomCount" value="${room.hotelRoomCount}">
					<a href="/hotel/deleteRoom?hotelRoomNum=${room.hotelRoomNum}">삭제</a>
					<button type="submit">수정</button>
				</form>
			
			</li>
		</c:forEach>
	</ul>
</body>

<script type="text/javascript">
const modisus = `<c:out value="${susmodi}"/>`;
const susdel = `<c:out value="${susdel}"/>`;
</script>
<script type="text/javascript" src="/resources/js/hotel/roomList.js"></script>
</html>