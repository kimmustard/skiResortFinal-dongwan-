<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../common/nav.jsp"></jsp:include>
	
		<div class="bodyContainer">
			<div class="registerContainer">
				
				<form action="/member/register" method="post">
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