<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/notice/notice_detail.css">
</head>
<body>
<jsp:include page="../common/nav.jsp" />
<div class="notice-img-container" style="background-image: url('https://a.cdn-hotels.com/gdcs/production68/d766/4cc034a7-aeb1-4edd-b2a9-f7feaac49aec.jpg')">	</div>

	<div class="container">
	<br>
	<h2>공지사항</h2>
	<br>
	<form action="/notice/modify" method="post">
		<table class="table table-hover">
			<tr>
				<th>카테고리</th>
				<td>${nvo.noticeCategory}</td>
			</tr>	
			<tr>
				<th>제목</th>
				<td><input type="text" value="${nvo.noticeTitle }"> </td>
			</tr>	
			<tr>
				<th>작성자</th>
				<td>${nvo.noticeWriter }</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td>${nvo.noticeRegAt }</td>
			</tr>
			<tr>
				<th>마지막 수정일</th>
				<td>${nvo.noticeModAt }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="5" cols="50">${nvo.noticeContent }</textarea></td>
			</tr>
	
		</table>	
			<button type="submit" class="btn btn-dark" id="regBtn">수정완료</button>
			<a href="/notice/list">
				<button type="button" class="btn btn-dark">취소</button>
			</a>
	</form>		
	</div>
<jsp:include page="../common/footer.jsp" />	
</body>
</html>