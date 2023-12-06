<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<jsp:include page="../common/nav.jsp"></jsp:include>
	<link rel="stylesheet" href="/resources/css/hotel/roomList.css">

</head>
<body>
	<h1 class="text1">방 관리</h1>
	<ul>
		<c:forEach var="room" items="${roomList}">
			<li>
				<form action="/hotel/modifyRoom" method="post">			
				 <button type="button" onclick="modiroom(${room.hotelRoomNum})">${room.hotelRoomNum}</button>번 방  <input type="hidden" name="hotelRoomNum" value="${room.hotelRoomNum}" readonly="readonly">
					<div class="modify-box" id="room${room.hotelRoomNum}" style="display: none;">
					방이름<input type="text" name="hotelRoomName" value="${room.hotelRoomName}">
					방설명<input type="text" name="hotelRoomExplain" value="${room.hotelRoomExplain}">
					기준인원<input type="number" name="hotelRoomStandardPeople" value="${room.hotelRoomStandardPeople}">
					방종류<input type="text" name="hotelRoomType" value="${room.hotelRoomType}">
					방면적<input type="text" name="hotelRoomArea" value="${room.hotelRoomArea}">
					방요금<input type="number" name="hotelRoomFee" value="${room.hotelRoomFee}">
					객실수<input type="number" name="hotelRoomCount" value="${room.hotelRoomCount}">
					<a href="/hotel/deleteRoom?hotelRoomNum=${room.hotelRoomNum}">삭제</a>
					<button type="submit">수정</button>
					</div>
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