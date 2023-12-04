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
						<span>기존 비밀번호 : </span> 
						<form:input type="text" path="exPwd" name="exPwd" />
						<form:errors class="errorFont" path="exPwd"></form:errors>
					</div>
					<div class="pwdChange pwd-Box2">
						<span>변경할 비밀번호 : </span> 
						<form:input type="text" path="changePwd" name="changePwd" />
						<form:errors class="errorFont" path="changePwd"></form:errors>
					</div>
					<div class="pwdChange pwd-Box3">
						<span>변경할 비밀번호 확인 : </span>
						<form:input type="text" path="changePwdCheck" name="changePwdCheck" />
						<form:errors class="errorFont" path="changePwdCheck"></form:errors>
					</div>
					<button type="submit"> 비밀번호 변경하기 </button>
				</form:form>
				</div>
			</div>	
		</div>
	</div>
	

	
	<div id="modalEmailCheckBtn"></div>
	<div id="inputMemberEmail"></div>
	
	<script type="text/javascript" src="/resources/js/member/MemberDetail.js"></script>
	
</body>
</html>