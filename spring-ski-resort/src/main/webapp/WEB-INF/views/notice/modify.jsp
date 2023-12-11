<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이스키 공지사항 수정페이지</title>
<link rel="stylesheet" href="/resources/css/notice/notice_detail.css">
</head>
<body>
<jsp:include page="../common/nav.jsp" />
<c:set value="${ndto.nvo }" var="nvo"></c:set>
<div class="notice-img-container" style="background-image: url('https://a.cdn-hotels.com/gdcs/production68/d766/4cc034a7-aeb1-4edd-b2a9-f7feaac49aec.jpg')">	</div>
<br><br><br><br><br><br><br>

	<div class="container">
	<br>
	<h2>공지사항</h2>
	<br>
	<form action="/notice/modify" method="post" enctype="multipart/form-data">
		<table class="table table-hover">
			<tr>
				<th>번호</th>
				<td><input type="text" name="noticeNum" value="${nvo.noticeNum}" readonly="readonly"></td>
			</tr>	
			<tr>
				<th>제목</th>
				<td><input type="text" name="noticeTitle" value="${nvo.noticeTitle }"></td>
			</tr>	
			<tr>
				<th><label for="exampleFormControlInput1" class="form-label">카테고리</label></th>
				<td>
					<div class="mb-3">
					  <select class="form-select" name="noticeCategory" id="inputGroupSelect01">
					  	<option ${nvo.noticeCategory ne null }>${nvo.noticeCategory }</option>
					  	<c:choose>
					  		<c:when test="${nvo.noticeCategory == '공지사항'}">
					  		<option value="이벤트">이벤트</option>
					  		<option value="보도자료">보도자료</option>
					  		<option value="쇼핑몰">쇼핑몰</option>
					  		<option value="채용정보">채용정보</option>
					  		<option value="기타">기타</option>
					  		</c:when>
					  	</c:choose>
					  	<c:choose>
					  		<c:when test="${nvo.noticeCategory == '이벤트'}">
					  		<option value="공지사항">공지사항</option>
					  		<option value="보도자료">보도자료</option>
					  		<option value="쇼핑몰">쇼핑몰</option>
					  		<option value="채용정보">채용정보</option>
					  		<option value="기타">기타</option>
					  		</c:when>
					  	</c:choose>
					  	<c:choose>
					  		<c:when test="${nvo.noticeCategory == '보도자료'}">
					  		<option value="공지사항">공지사항</option>
					  		<option value="이벤트">이벤트</option>
					  		<option value="쇼핑몰">쇼핑몰</option>
					  		<option value="채용정보">채용정보</option>
					  		<option value="기타">기타</option>
					  		</c:when>
					  	</c:choose>
					  	<c:choose>
					  		<c:when test="${nvo.noticeCategory == '쇼핑몰'}">
					  		<option value="공지사항">공지사항</option>
					  		<option value="이벤트">이벤트</option>
					  		<option value="보도자료">보도자료</option>
					  		<option value="채용정보">채용정보</option>
					  		<option value="기타">기타</option>
					  		</c:when>
					  	</c:choose>
					  	<c:choose>
					  		<c:when test="${nvo.noticeCategory == '채용정보'}">
					  		<option value="공지사항">공지사항</option>
					  		<option value="이벤트">이벤트</option>
					  		<option value="보도자료">보도자료</option>
					  		<option value="쇼핑몰">쇼핑몰</option>
					  		<option value="기타">기타</option>
					  		</c:when>
					  	</c:choose>
					  	<c:choose>
					  		<c:when test="${nvo.noticeCategory == '기타'}">
					  		<option value="공지사항">공지사항</option>
					  		<option value="이벤트">이벤트</option>
					  		<option value="보도자료">보도자료</option>
					  		<option value="쇼핑몰">쇼핑몰</option>
					  		<option value="채용정보">채용정보</option>
					  		</c:when>
					  	</c:choose>
					  </select>
					</div>
				</td>
			</tr>	
			<tr>
				<th>작성자</th>
				<td><input type="hidden" name="noticeWriter">${nvo.noticeWriter }</td>
			</tr>
			<tr>
				<th>중요공지</th>
		  		<td>중요공지(상단고정)
		  		<input type="checkbox" name="noticePoint" value="Y">
		  		</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td>${nvo.noticeRegAt }</td>
			</tr>
			<tr>
				<th>마지막 수정일</th>
				<td>${nvo.noticeModAt }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
				<div>
					<!-- 파일표시란 -->
					<c:set value="${ndto.flist }" var="flist"></c:set>
					<ul class="list-group list-group-flush">
						<c:forEach items="${flist }" var="fvo">
							<li>
								<c:choose>
									<c:when test="${fvo.fileType > 0 }">
										<div>
										<img alt="" src="/upload/${fn: replace(fvo.fileSave,'\\','/')}/${fvo.fileUuid}_${fvo.fileName}">
										</div>
									</c:when>
								</c:choose>
							</li>
						</c:forEach>
					</ul>
				</div>
				<br>
				<textarea rows="5" cols="50" name="noticeContent">${nvo.noticeContent }</textarea>
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
									<img alt="그림이 없음." src="/upload/${fn: replace(fvo.fileSave,'\\','/')}/${fvo.fileUuid}_th_${fvo.fileName}">
								</div>
							</c:when>
						</c:choose>
						<div>
							<div><B>${fvo.fileName }</B></div>
				 			<div class="badge text-bg-secondary">${fvo.regDate }</div>
				 		</div>
				 		<span class="badge rounded-pill text-bg-success">${fvo.fileSize }Byte</span>
				 		<div>
				 			<button type="button" class="file-x btn btn-outline-secondary" data-uuid="${fvo.fileUuid }">X</button>
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
			<a href="/notice/list"><button type="button" class="btn btn-dark">취소</button></a>
	</form>
			<a href="/notice/remove?noticeNum=${nvo.noticeNum }">
			<button type="button" class="btn btn-danger">삭제하기</button>
			</a>		
	</div>

<br><br><br><br><br><br><br><br><br><br><br><br>	
<script type="text/javascript" src="/resources/js/notice/noticeFileModify.js"></script>
<script type="text/javascript" src="/resources/js/notice/noticeFileUpload.js"></script>
<jsp:include page="../common/footer.jsp" />	
</body>
</html>