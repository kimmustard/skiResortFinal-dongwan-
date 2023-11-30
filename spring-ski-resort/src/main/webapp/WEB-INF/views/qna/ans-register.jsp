<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/qna/qna_detail.css">
<jsp:include page="../common/nav.jsp" />
</head>
<body>
<c:set value="${qdto.qvo }" var="qvo"></c:set>

<div class="qna-img-container" style="background-image: url('https://www.princehotels.com/shinfurano/wp-content/uploads/sites/40/2022/11/2022_11_1920_ski_2-1.jpg')">	</div>
	
<div class="container qna-container">
	<br>
	<h2>Q&A 관리자 페이지</h2>
	<br>
	<table class="table table-hover">
		<tr>
			<th>카테고리</th>
			<td>${qvo.qnaCategory}</td>
		</tr>	
		<tr>
			<th>제목</th>
			<td>${qvo.qnaTitle }</td>
		</tr>	
		<tr>
			<th>작성자</th>
			<td>${qvo.qnaWriter }</td>
		</tr>	
		<tr>
			<th>답변상태</th>
			<td>${qvo.qnaIsok }</td>
		</tr>	
		<tr>
			<th>등록일</th>
			<td>${qvo.qnaRegAt }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${qvo.qnaContent }
				<div>
					<!-- 파일표시란 -->
					<c:set value="${qdto.flist }" var="flist"></c:set>
					<ul class="list-group list-group-flush">
						<c:forEach items="${flist }" var="fvo">
							<li>
								<c:choose>
									<c:when test="${fvo.fileType > 0 }">
										<div>
										<img alt="이미지x" src="/upload/${fn: replace(fvo.saveDir,'\\','/')}/${fvo.uuid}_${fvo.fileName}">
										</div>
									</c:when>
								</c:choose>
							</li>
						</c:forEach>
					</ul>
				</div>
			</td>
		</tr>

	</table>	
	<br><br><br>
	
	
	<!-- 답변 등록 구간 -->
	<form action="/qna/modify" method="post" enctype="multipart/form-data">
		<table class="table table-hover">
			
			<tr>
				<th><label for="exampleFormControlInput1" class="form-label">작성자</label></th>
				<td>
					<div class="mb-3">
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
					  	<input type="text" class="form-control" name="qnaWriter" id="exampleFormControlInput1" value="관리자" readonly="readonly">
					  </sec:authorize>
					</div>
				</td>
			</tr>
			<tr>
				<th>답변내용</th>
				<td>
				<div>
				<textarea class="form-control" rows="5" cols="50"  name="qnaAnsContent" rows="5"></textarea>
				<br>
				</div>	
				</td>
			</tr>
		</table>	
	<br>	

		<div class="mb-3" id="fileZone">
		<!-- 첨부파일 표시 영역 -->
		</div>
		<div class="mb-3">
		  <input type="file" class="form-control" name="files" id="files" style="display: none;" multiple="multiple">
		  <button type="button" id="trigger" class="btn btn-outline-primary">이미지 첨부파일</button>
		</div>

		<button type="submit" class="btn btn-dark" id="regBtn">등록</button>
		<a href="/qna/list"><button type="button" class="btn btn-dark">취소</button></a>
	</form>

</div>


<script type="text/javascript" src="/resources/js/qna/qnaFileModify.js"></script>
<script type="text/javascript" src="/resources/js/qna/qnaFileUpload.js"></script>
<jsp:include page="../common/footer.jsp" />
</body>
</html>