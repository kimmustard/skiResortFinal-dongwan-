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
<br><br><br><br><br><br><br>

<div class="container">
	<br>
	<br>
	<form action="/qna/modify" method="post" enctype="multipart/form-data">
		<table class="table table-hover">
			<tr>
				<th>번호</th>
				<td><input type="text" name="qnaNum" value="${qvo.qnaNum}" readonly="readonly"></td>
			</tr>	
			<tr>
				<th>제목</th>
				<td><input type="text" name="qnaTitle" value="${qvo.qnaTitle }"></td>
			</tr>	
			<tr>
				<th><label for="exampleFormControlInput1" class="form-label">카테고리</label></th>
				<td>
					<div class="mb-3">
					  <select class="form-select" name="qnaCategory" id="inputGroupSelect01">
					  	<option ${qvo.qnaCategory ne null }>${qvo.qnaCategory }</option>
					  	<c:choose>
					  		<c:when test="${qvo.qnaCategory == '스키장'}">
					  		<option value="호텔">호텔</option>
					  		<option value="렌탈">렌탈</option>
					  		<option value="교통">교통</option>
					  		<option value="예약">예약</option>
					  		<option value="결제">결제</option>
					  		<option value="기타">기타</option>
					  		</c:when>
					  	</c:choose>
					  	<c:choose>
					  		<c:when test="${qvo.qnaCategory == '호텔'}">
					  		<option value="스키장">스키장</option>
					  		<option value="렌탈">렌탈</option>
					  		<option value="교통">교통</option>
					  		<option value="예약">예약</option>
					  		<option value="결제">결제</option>
					  		<option value="기타">기타</option>
					  		</c:when>
					  	</c:choose>
					  	<c:choose>
					  		<c:when test="${qvo.qnaCategory == '렌탈'}">
					  		<option value="스키장">스키장</option>
					  		<option value="호텔">호텔</option>
					  		<option value="교통">교통</option>
					  		<option value="예약">예약</option>
					  		<option value="결제">결제</option>
					  		<option value="기타">기타</option>
					  		</c:when>
					  	</c:choose>
					  	<c:choose>
					  		<c:when test="${qvo.qnaCategory == '교통'}">
					  		<option value="스키장">스키장</option>
					  		<option value="호텔">호텔</option>
					  		<option value="렌탈">렌탈</option>
					  		<option value="예약">예약</option>
					  		<option value="결제">결제</option>
					  		<option value="기타">기타</option>
					  		</c:when>
					  	</c:choose>
					  	<c:choose>
					  		<c:when test="${qvo.qnaCategory == '예약'}">
					  		<option value="스키장">스키장</option>
					  		<option value="호텔">호텔</option>
					  		<option value="렌탈">렌탈</option>
					  		<option value="교통">교통</option>
					  		<option value="결제">결제</option>
					  		<option value="기타">기타</option>
					  		</c:when>
					  	</c:choose>
					  	<c:choose>
					  		<c:when test="${qvo.qnaCategory == '결제'}">
					  		<option value="스키장">스키장</option>
					  		<option value="호텔">호텔</option>
					  		<option value="렌탈">렌탈</option>
					  		<option value="교통">교통</option>
					  		<option value="예약">예약</option>
					  		<option value="기타">기타</option>
					  		</c:when>
					  	</c:choose>
					  	<c:choose>
					  		<c:when test="${qvo.qnaCategory == '기타'}">
					  		<option value="스키장">스키장</option>
					  		<option value="호텔">호텔</option>
					  		<option value="렌탈">렌탈</option>
					  		<option value="교통">교통</option>
					  		<option value="예약">예약</option>
					  		<option value="결제">결제</option>
					  		</c:when>
					  	</c:choose>
					  </select>
					</div>
				</td>
			</tr>	
			<tr>
				<th>작성자</th>
				<td><input type="hidden" name="qnaWriter">${qvo.qnaWriter }</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td>${qvo.qnaRegAt }</td>
			</tr>
			<tr>
				<th>마지막 수정일</th>
				<td>${qvo.qnaModAt }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
				<div>
					<!-- 파일표시란 -->
					<c:set value="${qdto.flist }" var="flist"></c:set>
					<ul class="list-group list-group-flush">
						<c:forEach items="${flist }" var="fvo">
							<li>
								<c:choose>
									<c:when test="${fvo.fileType > 0 }">
										<div>
										<img alt="" src="/upload/${fn: replace(fvo.saveDir,'\\','/')}/${fvo.uuid}_${fvo.fileName}">
										</div>
									</c:when>
								</c:choose>
							</li>
						</c:forEach>
					</ul>
				</div>
				<br>
				<textarea rows="5" cols="50" name="qnaContent">${qvo.qnaContent }</textarea>
				</td>
			</tr>
		</table>	
	<br>	
	
		<!-- 첨부파일 표시 영역 -->
		<div>
			<ul>
				<c:forEach items="${flist }" var="fvo">
					<li>
						<c:choose>
							<c:when test="${fvo.fileType > 0 }">
								<div>
									<img alt="그림이 없음." src="/upload/${fn: replace(fvo.saveDir,'\\','/')}/${fvo.uuid}_th_${fvo.fileName}">
								</div>
							</c:when>
						</c:choose>
						<div>
							<div><B>${fvo.fileName }</B></div>
				 			<div class="badge text-bg-secondary">${fvo.regDate }</div>
				 		</div>
				 		<span class="badge rounded-pill text-bg-success">${fvo.fileSize }Byte</span>
				 		<div>
				 			<button type="button" class="file-x btn btn-outline-secondary" data-uuid="${fvo.uuid }">X</button>
						</div>
						<br>
					</li>
				</c:forEach>
			</ul>
		</div>
		
		<div class="mb-3" id="fileZone">
		<!-- 첨부파일 표시 영역 -->
		</div>
		<div class="mb-3">
		  <input type="file" class="form-control" name="files" id="files" style="display: none;" multiple="multiple">
		  <button type="button" id="trigger" class="btn btn-outline-primary">이미지파일 등록</button>
		</div>


		
			<button type="submit" class="btn btn-dark" id="regBtn">수정완료</button>
			<a href="/qna/list"><button type="button" class="btn btn-dark">취소</button></a>
	</form>
			<a href="/qna/remove?qnaNum=${qvo.qnaNum }">
			<button type="button" class="btn btn-danger">삭제하기</button>
			</a>		
	</div>

<br><br><br><br><br><br><br><br><br><br><br><br>	
<script type="text/javascript" src="/resources/js/qna/qnaFileModify.js"></script>
<script type="text/javascript" src="/resources/js/qna/qnaFileUpload.js"></script>
<jsp:include page="../common/footer.jsp" />	

</body>
</html>