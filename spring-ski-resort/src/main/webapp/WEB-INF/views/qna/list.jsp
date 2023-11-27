<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/notice/notice_list.css">
<jsp:include page="../common/nav.jsp" />
</head>
<body>
	<div class="notice-img-container" style="background-image: url('https://a.cdn-hotels.com/gdcs/production68/d766/4cc034a7-aeb1-4edd-b2a9-f7feaac49aec.jpg')">	</div>
	
<div class="container notice-container" id="notice-container">
<div>자주하는 질문(FAQ)</div>
<br>
<div>내가 작성한 질문(Q&A)</div>
	<a href="/qna/register">
		<button type="button">글작성</button>
	</a>





</div>
<jsp:include page="../common/footer.jsp" />
</body>
</html>