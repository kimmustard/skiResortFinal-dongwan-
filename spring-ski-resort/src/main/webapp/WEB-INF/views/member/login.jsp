<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.bodyContainer{
		width: 100%;
		height: 1500px;
	}
	
	.loginContainer{
		margin: 150px;
	}
</style>
</head>
<body>
	<jsp:include page="../common/nav.jsp"></jsp:include>
	
	<div class="bodyContainer">
	
		<div class="loginContainer">
			<form action="/member/login" method="post">
				<div>
					<span>아이디</span><input type="text" name="memberId">
				</div>
				<div>
					<span>비밀번호</span><input type="password" name="memberPwd">
				</div>
				<button type="submit">로그인</button> 
			</form>
		</div>	
		
	</div>
	
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>