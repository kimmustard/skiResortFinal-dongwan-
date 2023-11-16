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
	<div class="notice-category">
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
	  <li class="nav-item" role="presentation">
	    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">
	    쇼핑몰</button>
	  </li>
	  <li class="nav-item" role="presentation">
	    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">
	    채용정보</button>
	  </li>
	  <li class="nav-item" role="presentation">
	    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">
	    기타</button>
	  </li>
	</ul>
	</div>
	
	
	<!-- 리스트 테이블 라인 -->
	<table class="table"  >
	  <thead >
	    <tr class="notice-table-tr">
	      <th scope="col" class="notice-table-td">번호</th>
	      <th scope="col" class="notice-table-td">카테고리</th>
	      <th scope="col" class="notice-table-td">제목</th>
	      <th scope="col" class="notice-table-td">작성자</th>
	      <th scope="col" class="notice-table-td">등록일</th>
	      <th scope="col" class="notice-table-td">조회</th>
	    </tr>
	  </thead>
	  <tbody>
	    <tr class="notice-table-tr">
	      <th scope="row" class="notice-table-td">1</th>
	      <td class="notice-table-td">Mark</td>
	      <td class="notice-table-td"><a href="/notice/detail">제목제목</a></td>
	      <td class="notice-table-td">@mdzdo</td>
	      <td class="notice-table-td">@mdo</td>
	    </tr>
	    <tr class="notice-table-tr">
	      <th scope="row" class="notice-table-td">2</th>
	      <td class="notice-table-td">Jacob</td>
	      <td class="notice-table-td">Thornton</td>
	      <td class="notice-table-td">Thornton</td>
	      <td class="notice-table-td">Thornton</td>
	      <td class="notice-table-td">@fat</td>
	    </tr>
	    <tr class="notice-table-tr">
	      <th scope="row" class="notice-table-td">3</th>	      
	      <td class="notice-table-td">@twitter</td>
	      <td class="notice-table-td">@twitter</td>
	      <td class="notice-table-td">@twitter</td>
	      <td class="notice-table-td">@twitter</td>
	      <td class="notice-table-td">@twitter</td>
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