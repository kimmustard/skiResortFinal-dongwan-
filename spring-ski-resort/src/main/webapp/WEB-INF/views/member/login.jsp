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
 <link rel="stylesheet" href="/resources/css/loginbootstrap.css">
</head>
<body>
	<jsp:include page="../common/nav.jsp"></jsp:include>
	
	<div class="bodyContainer">
	
		<div class="loginContainer">
			<form action="/member/login" method="post">
				
				<div class="form-group">
				  <label class="col-form-label mt-4" for="inputDefault">
				  	<span class="loginFont">아이디</span>
				  </label>
				  <input type="text" class="form-control" name="memberId" placeholder="아이디를 입력하세요." id="inputDefault">
				</div>
				 <div class="form-group">
			      <label for="exampleInputPassword1" class="form-label mt-4">
			      	<span class="loginFont">비밀번호</span>
			      </label>
			      <input type="password" class="form-control" name="memberPwd" id="exampleInputPassword1" placeholder="Password" autocomplete="off">
			    </div>
						
			
				<button type="submit" class="btn btn-primary">로그인</button> 
			</form>
		</div>	
		
	</div>
	
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>