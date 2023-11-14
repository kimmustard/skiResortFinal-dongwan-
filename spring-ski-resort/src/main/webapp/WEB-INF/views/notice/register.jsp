<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../common/nav.jsp" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
	<form action="/board/register" method="post" enctype="multipart/form-data">
		<div class="mb-3">
		  <label for="exampleFormControlInput1" class="form-label">제목</label>
		  <input type="text" class="form-control" name="title" id="exampleFormControlInput1" placeholder="제목입력">
		</div>
		<div class="mb-3">
		  <label for="exampleFormControlInput1" class="form-label">카테고리</label>
		  <input type="text" class="form-control" name="title" id="exampleFormControlInput1">
		</div>
		<div class="mb-3">
		  <label for="exampleFormControlInput1" class="form-label">작성자</label>
		  <input type="text" class="form-control" name="writer" id="exampleFormControlInput1" value="" readonly="readonly">
		</div>
		<div class="mb-3">
		  <label for="exampleFormControlTextarea1" class="form-label">내용</label>
		  <textarea class="form-control" name="content" id="exampleFormControlTextarea1" rows="3"></textarea>
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

</body>
</html>