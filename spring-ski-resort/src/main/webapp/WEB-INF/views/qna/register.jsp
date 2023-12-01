<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/qna/qna_list.css">
<jsp:include page="../common/nav.jsp" />  
</head>
<body>
<div class="qna-img-container" style="background-image: url('https://www.princehotels.com/shinfurano/wp-content/uploads/sites/40/2022/11/2022_11_1920_ski_2-1.jpg')">	</div>
<br><br><br><br><br><br><br>
<div class="container">   	

	<form action="/qna/register" method="post" enctype="multipart/form-data">
		
		<div class="mb-3">
		  <label for="exampleFormControlInput1" class="form-label">제목</label>
		  <input type="text" class="form-control" name="qnaTitle" id="exampleFormControlInput1" placeholder="제목입력">
		</div>
		
		<div class="mb-3">
		  <label for="exampleFormControlInput1" class="form-label">범주</label>
		  <select class="form-select" name="qnaCategory" id="inputGroupSelect01">
		  	<option value="스키장">스키장</option>
		  	<option value="호텔">호텔</option>
		  	<option value="렌탈">렌탈</option>
		  	<option value="교통">교통</option>
		  	<option value="예약">예약</option>
		  	<option value="결제">결제</option>
		  	<option value="기타">기타</option>
		  </select>
		</div>
		
		<div class="mb-3">
		  <label for="exampleFormControlInput1" class="form-label">작성자</label>
		  <sec:authorize access="isAuthenticated()"> <!-- 로그인 -->
			<sec:authentication property="principal.mvo.memberId" var="authId"/>
			<sec:authentication property="principal.mvo.memberEmail" var="authEmail"/>
			<sec:authentication property="principal.mvo.memberAlias" var="authAlias"/>
			<sec:authentication property="principal.mvo.memberType" var="authType"/>
			  <c:if test="${authType == 'normal' }">
			  	<input type="text" class="form-control" name="qnaWriter" id="exampleFormControlInput1" value="${authId }" readonly="readonly">
			  </c:if>
			  <c:if test="${authType != 'normal' }">
			  	<input type="text" class="form-control" name="qnaWriter" id="exampleFormControlInput1" value="${authEmail }" readonly="readonly">
			  </c:if>
		  </sec:authorize>
		  <sec:authorize access="isAnonymous()"> <!-- 로그인 x -->
		  	<input type="text" class="form-control" name="qnaWriter" id="exampleFormControlInput1" value="비회원" readonly="readonly">
		  </sec:authorize>
		</div>
		
		<div class="mb-3">
		  <label for="exampleFormControlInput1" class="form-label">비밀글</label>
		  <input type="checkbox" name="qnaSecret" value="Y">
		</div>
		
		<div class="mb-3">
		  <label for="exampleFormControlTextarea1" class="form-label">문의내용</label>
		  <textarea class="form-control" name="qnaContent" rows="3"></textarea>
		</div>
		
		<div class="mb-3">
		  <input type="file" class="form-control" name="files" id="files" style="display: none;" multiple="multiple">
		  <!-- input button trigger 용도의 button -->
		  <button type="button" id="trigger" class="btn btn-outline-primary">이미지 첨부파일</button>
		</div>
		
		<div class="mb-3" id="fileZone">
		<!-- 첨부파일 표시 영역 -->
		</div>
		<div>
		<button type="submit" class="btn btn-dark" id="regBtn">등록</button>
		</div>
	</form>
</div>

<br><br><br><br><br><br><br><br><br><br><br><br>
<script type="text/javascript" src="/resources/js/qna/qnaFileUpload.js"></script>
<jsp:include page="../common/footer.jsp" />
</body>
</html>