<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.bodyContainer{
		width: 100%;
		height: 1000px;
		position: relative;
	}
	
	.loginContainer{
		width: 500px;
		background-color: #593196;
		position: absolute;
		top:40%;
		left: 50%;
	    transform: translate(-50%, -50%);
	}
	
	.login-box{
		margin: 50px;
		margin-left: 100px;
		width: 300px;
		height: 300px;
	}
	
	.btn-box{
		width: 300px;
		display: flex;
		justify-content: space-around;
		margin-top: 50px;
	}
	
	
	.login-btn{
		width: 100px;
	}
	.bodyContainer>video{
	position: absolute;
	left: 0;
	top: 0;
	z-index: -1;
}

</style>
<link rel="stylesheet" href="/resources/css/loginbootstrap.css">
</head>
<body>
	<jsp:include page="../common/nav.jsp"></jsp:include>
	
	<div class="bodyContainer">
	<video width="100%" height="auto" autoplay loop muted>
	<source src="https://www.chamonix.com/sites/default/files/media/videos/homepage-vallorcine%201.mp4" type="video/mp4">
	</video>
		<div class="loginContainer">
			<form action="/member/login" method="post">
				<div class="login-box">
				
					<div class="form-group">
						  <label class="col-form-label mt-4" for="inputDefault">
						  	<span class="loginFont">아이디</span>
						  </label>
						  <input type="text" class="form-control" name="memberId" placeholder="아이디" id="inputDefault">
					</div>
					
					 <div class="form-group">
					      <label for="exampleInputPassword1" class="form-label mt-4">
					      	<span class="loginFont">비밀번호</span>
					      </label>
					      <input type="password" class="form-control" name="memberPwd" id="exampleInputPassword1" placeholder="비밀번호" autocomplete="off">
				    </div>
				    <div class="btn-box">
						<button type="submit" class="btn btn-primary login-btn">로그인</button> 
						<a href="/member/register"><button type="button" class="btn btn-primary login-btn">회원가입</button></a>
					</div>
				
					
				</div>	
			
			</form>
			<div id="kakao_id_login" style="text-align: center">
				<a href="#">
				<img width="223" height="52" src="/resources/etc/kakao_login_medium_narrow.png" /></a>
       		</div>

			
			<div id="naver_id_login" style="text-align: center">
				<a href="#"><img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
			</div>
			
			<div id="google_id_login" style="text-align:center">
				<a href="#"><img width="223" src="/resources/etc/web_neutral_sq_SI@1x.png"/></a>
			</div>


			<br>
			
		</div>	
		
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<script type="text/javascript" src="/resources/js/member/OauthLogin.js"></script>
</body>
</html>