<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/notice/notice_list.css">
</head>
<body>
<jsp:include page="../common/nav.jsp" />
<div class="notice-img-container" style="background-image: url('https://a.cdn-hotels.com/gdcs/production68/d766/4cc034a7-aeb1-4edd-b2a9-f7feaac49aec.jpg')">	</div>
<br><br><br><br><br><br><br>
<div class="container">
	<form action="/notice/register" method="post">
	
		<div class="mb-3">
		  <label for="exampleFormControlInput1" class="form-label">제목</label>
		  <input type="text" class="form-control" name="noticeTitle" id="exampleFormControlInput1" placeholder="제목입력">
		</div>
		
		<div class="mb-3">
		  <label for="exampleFormControlInput1" class="form-label">카테고리</label>
		  <select class="form-select" name="noticeCategory" id="inputGroupSelect01">
		  	<option value="공지사항">공지사항</option>
		  	<option value="이벤트">이벤트</option>
		  	<option value="보도자료">보도자료</option>
		  	<option value="쇼핑몰">쇼핑몰</option>
		  	<option value="채용정보">채용정보</option>
		  	<option value="기타">기타</option>
		  </select>
		</div>
		
		<div class="mb-3">
		  <label for="exampleFormControlInput1" class="form-label">작성자</label>
		  <input type="text" class="form-control" name="noticeWriter" id="exampleFormControlInput1" value="운영자" readonly="readonly">
		</div>
		
		<div class="mb-3">
		  <label for="exampleFormControlTextarea1" class="form-label">내용</label>
		  <textarea class="form-control" name="noticeContent" id="exampleFormControlTextarea1" rows="3"></textarea>
		</div>
		
		<div class="mb-3">
		  <input type="file" class="form-control" name="files" id="files" style="display: none;" multiple="multiple">
		  <!-- input button trigger 용도의 button -->
		  <button type="button" id="trigger" class="btn btn-outline-primary">File Upload</button>
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
<jsp:include page="../common/footer.jsp" />
</body>
</html>