<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<jsp:include page="../common/nav.jsp"></jsp:include>
<link  href="/resources/css/member/detail.css" rel="stylesheet">
</head>
<body>
	<div class="bodyContainer">
	<div class="backgroundImgPwd">
	
	</div>
	<!-- 왼쪽 카테고리  -->
	<div class="mainCategory">
	<jsp:include page="../common/member_category.jsp"></jsp:include>
	</div>
	<!-- 오른쪽 메인화면 -->
		<div class="mainView">
			<div class="mainViewBody3">
				<div class="mainViewBox4">
				<form:form action="/member/memberPwd" modelAttribute="mpDTO" method="post">
					<h3> 비밀번호 변경 </h3>
					<div class="pwdChange pwd-Box1">
						<div class="pwd-miniBox">
							<label class="pwdLabel" for="pwdBox1">
					          현재 비밀번호 : 
					        </label>
							<form:input id="pwdBox1" type="password" path="exPwd" name="exPwd" />
						</div>
						<form:errors class="errorFont" path="exPwd"></form:errors>
					</div>
					<div class="pwdChange pwd-Box2">
						<div class="pwd-miniBox">
							<label class="pwdLabel" for="pwdBox2">
					          새 비밀번호 : 
					        </label>
							<form:input id="pwdBox2" type="password" path="changePwd" name="changePwd" />
						</div>
						<form:errors class="errorFont" path="changePwd"></form:errors>
					</div>
					<div class="pwdChange pwd-Box3">
						<div class="pwd-miniBox">
							<label class="pwdLabel" for="pwdBox3">
					          비밀번호 확인 : 
					        </label>
							<form:input id="pwdBox3" type="password" path="changePwdCheck" name="changePwdCheck" />
						</div>
						<form:errors class="errorFont" path="changePwdCheck"></form:errors>
					</div>
					<button class="pwd-change-btn btn-3 btn btn-primary" type="submit"> 비밀번호 변경하기 </button>
				</form:form>
				</div>
			</div>	
		</div>
	</div>
	
	<script type="text/javascript">
		const isMod = `<c:out value="${isMod}" />`;
		if(isMod == 1){
			alert('회원 정보수정이 완료되었습니다. 안전을 위해 로그아웃이 진행됩니다.');
		}else(isMod == 2){
			alert('현재 비밀번호와 일치하지 않습니다.');
		}
	</script>
	
	<div id="modalEmailCheckBtn"></div>
	<div id="inputMemberEmail"></div>
	
	<script type="text/javascript" src="/resources/js/member/MemberDetail.js"></script>
	
</body>
</html>