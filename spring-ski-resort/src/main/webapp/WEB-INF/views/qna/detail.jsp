<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	<h2>공지사항</h2>
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
	
	<a href="/qna/list">
		<button type="button" class="btn btn-dark">리스트</button>
	</a>
	<a href="/qna/modify?qnaNum=${qvo.qnaNum }">
		<button type="button" class="btn btn-dark">수정</button>
	</a>
	</div>


<jsp:include page="../common/footer.jsp" />	
</body>
</html>