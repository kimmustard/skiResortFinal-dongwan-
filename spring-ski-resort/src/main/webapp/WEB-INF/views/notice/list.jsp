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
<div class="container notice-container" >

	<!-- 검색 라인  -->
	<div class="notice-search-container">
		<div class="notice-search-category">제목</div>
		<div class="notice-input-container">
			<input placeholder="검색어를 입력해 주세요." type="text" class="notice-search-input">
		</div>
		<div class="notice-button-container">
			<button class="notice-search-button">검색</button>
		</div>
	</div>
	
	<!-- 카테고리 라인 -->
	<!-- <ul class="notice-ul-category">
		<li>전체</li>
		<li>공지사항</li>
		<li>이벤트</li>
		<li>보도자료</li>
		<li>쇼핑몰</li>
		<li>채용정보</li>
		<li>기타</li>
	</ul> -->
	<ul class="nav nav-tabs" id="myTab" role="tablist">
	  <li class="nav-item" role="presentation">
	    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">
	    전체</button>
	  </li>
	  <li class="nav-item" role="presentation">
	    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">
	    공지사항</button>
	  </li>
	  <li class="nav-item" role="presentation">
	    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">
	    이벤트</button>
	  </li>
	  <li class="nav-item" role="presentation">
	    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">
	    보도자료</button>
	  </li>
	</ul>
	
	

	<table class="table"  >
	  <thead >
	    <tr>
	      <th scope="col">No.</th>
	      <th scope="col">카테고리</th>
	      <th scope="col">제목</th>
	      <th scope="col">작성자</th>
	      <th scope="col">등록일</th>
	      <th scope="col">조회</th>
	    </tr>
	  </thead>
	  <tbody>
	    <tr>
	      <th scope="row">1</th>
	      <td>Mark</td>
	      <td><a href="/notice/detail">제목제목</a></td>
	      <td>@mdzdo</td>
	      <td>@mdo</td>
	    </tr>
	    <tr>
	      <th scope="row">2</th>
	      <td>Jacob</td>
	      <td>Thornton</td>
	      <td>Thornton</td>
	      <td>Thornton</td>
	      <td>@fat</td>
	    </tr>
	    <tr>
	      <th scope="row">3</th>	      
	      <td>@twitter</td>
	      <td>@twitter</td>
	      <td>@twitter</td>
	      <td>@twitter</td>
	      <td>@twitter</td>
	    </tr>
	  </tbody>
	</table>
	<a href="/notice/register">
	<button type="button">글작성</button>
	</a>
</div>
<jsp:include page="../common/footer.jsp" />
</body>
</html>