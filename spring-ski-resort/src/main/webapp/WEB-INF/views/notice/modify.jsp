<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
	<br>
	<h2>공지사항</h2>
	<br>
	<table class="table table-hover">
		<tr>
			<th>제목</th>
			<td><input type="text" value=""> </td>
		</tr>	
		<tr>
			<th>카테고리</th>
			<td>이벤트</td>
		</tr>	
		<tr>
			<th>등록일</th>
			<td>2023.11.14</td>
		</tr>
		<tr>
			<th>수정일</th>
			<td>2023.11.14</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="5" cols="50"></textarea></td>
		</tr>

	</table>	
	
	<a href="/notice/list">
		<button type="button" class="btn btn-dark">리스트</button>
	</a>
	</div>
</body>
</html>