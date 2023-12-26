<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link  href="/resources/css/member/findId.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../common/nav.jsp"></jsp:include>

	<div class="bodyContainer">
		<video width="100%" height="auto" autoplay loop muted>
		<source src="https://www.chamonix.com/sites/default/files/media/videos/homepage-servoz%201.mp4" type="video/mp4">
		</video>
	
	<div class="findMainBody">
		<div class="findMenu">
			<a id="find-id-menu" href="/member/findId">아이디찾기</a>
			<a id="find-pwd-menu" href="/member/findPwd">비밀번호찾기</a>
		</div>
		
		<form action="/member/findId" method="post">
		<div class="findBoxContainer">
			<img alt="" width="180" height="160" src="/resources/etc/logo_black.png">
			<div class="findBox find-email-box">
				<label for="inputMemberEmail" class="sb1-span" onclick="focusInput('sb1-input4')">이메일</label>
				<input type="text" id="inputMemberEmail" name="memberEmail" readonly="readonly" placeholder="이메일을 입력해주세요."/>
				<button type="button" class="btn btn-primary" id="MemberEmailCheck" data-bs-toggle="modal" data-bs-target="#staticBackdrop" style="display: none;">
			 		이메일 인증
			 	</button>
			</div>
			<div class="findBox find-pwd-box">
				<label for="findId-name-input">이름</label>
				<input type="text" id="findId-name-input" name="memberName" placeholder="이름을 입력해주세요.">
			</div>
			
			<div class="findBox find-btn-box">
				<button class="btnBox" id="id-btn" type="submit">아이디찾기</button>
				<a href="/"><button class="btnBox" id="main-btn" type="button">메인으로</button></a> 
			</div>
		</div>
		</form>

	</div>
	
	
	
	</div>
	
	<!-- 이메일 인증 팝업 -->
	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog" tabindex="-1">
		    <div class="modal-content" tabindex="-1">
		      <div class="modal-header" tabindex="-1">
		        <h1 class="modal-title fs-5" id="staticBackdropLabel" tabindex="-1">아이디 찾기</h1>
		        <button type="button" class="btn-close" id="modalClose" data-bs-dismiss="modal" aria-label="Close" tabindex="-1"></button>
		      </div>
		      <div class="modal-body" tabindex="-1">
		        <div class="form-group registerBox rb-5" tabindex="-1">
				     <label for="modalEmailCheck" class="form-label mt-4" tabindex="-1">Email</label>
				     <div class="input-group mb-3" tabindex="-1">
					     <input type="email" class="form-control" id="modalEmailCheck" aria-describedby="emailHelp" placeholder="이메일"  tabindex="-1" />
					     <button type="button" class="btn btn-primary" id="modalEmailCheckBtn" tabindex="-1">
						 	인증번호 받기
						 </button>
				  		 </div>
					 <div id="emailDuplicateCheck" tabindex="-1"></div>
		      </div>
		      <div class="modal-body" id="modal-body2" tabindex="-1">
		       
		      </div>
		      <div class="modal-footer" tabindex="-1">
		        <input type="button" class="btn btn-primary" id="emailCheckSuccess" value="인증완료" tabindex="-1">
		      </div>
		    </div>
		  </div>
		</div>

	</div>	
	
	<script type="text/javascript">
		const isOk = `<c:out value="${isOk}" />`;
		if(isOk == 1){
			alert('입력하신 회원정보가 일치하지 않습니다.');
		}
	</script>
	
	<script type="text/javascript" src="/resources/js/find/find.js"></script>
</body>
</html>