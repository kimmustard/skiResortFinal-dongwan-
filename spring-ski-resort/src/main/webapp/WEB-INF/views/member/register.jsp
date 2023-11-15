<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	.registerContainer{
		width: 800px;
		background-color: #13b955;
		position: absolute;
		top:40%;
		left: 50%;
	    transform: translate(-50%, -50%);
	}
	
</style>
</head>
<body>

	<jsp:include page="../common/nav.jsp"></jsp:include>
	
		<div class="bodyContainer">
			<div class="registerContainer">
				
				<form action="/member/register" method="post">
					<div>
						<span>아이디</span><input type="text" name="memberId">
						<button>중복확인</button>
					</div>
					<div>
						<span>비밀번호</span><input type="password" name="memberPwd">
					</div>
					<div>
						<span>비밀번호확인</span><input type="password">
					</div>
					<div>
						<span>닉네임</span><input type="text" name="memberAlias">
						<button>중복확인</button>
					</div>
						<div>
						<span>남</span><input name="memberGender" type="radio">
						<span>여</span><input name="memberGender" type="radio">
					</div>
					<div>
						<span>이메일인증</span> <input type="email" name="memberEmail">
					</div>
					<div>
						<span>주소</span> <input type="email" name="memberAdderss">
					</div>
	
				
					
					
					
					<button type="submit">로그인</button> 
				</form>
			</div>	
			
		</div>
	
	<jsp:include page="../common/footer.jsp"></jsp:include>

	
</body>
</html>