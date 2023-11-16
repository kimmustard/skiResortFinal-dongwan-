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
	<div class="notice-img-container" style="background-image: url(&quot;https://www.hansbiz.co.kr/news/photo/201612/59818_87104_137.jpg;);">
		
	</div>
<div class="container notice-container" >

	
	<div class="notice-menu-container">
		<!-- 검색 라인  -->
		<div class="notice-search-container">
		<div class="dropdown notice-search-category">
			  <!-- <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false"> -->
			  <button class="notice-search-category dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
			    전체
			  </button>
			  <ul class="dropdown-menu">
			    <li><a class="dropdown-item" href="#">제목</a></li>
			    <li><a class="dropdown-item" href="#">내용</a></li>
			    <li><a class="dropdown-item" href="#">전체</a></li>
			  </ul>
			</div>
			<!-- <div class="notice-search-category">제목</div> -->
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
		<table class="table notice-table"  >
		  <thead >
		    <tr class="notice-table-tr">
		      <th scope="col" class="notice-table-th-no"><div class="notice-table-td-child">번호</div></th>
		      <th scope="col" class="notice-table-th-cago"><div class="notice-table-td-child">카테고리</div></th>
		      <th scope="col" class="notice-table-th-title"><div class="notice-table-td-child">제목</div></th>
		      <th scope="col" class="notice-table-th-writer"><div class="notice-table-td-child">작성자</div></th>
		      <th scope="col" class="notice-table-th-reg"><div class="notice-table-td-child">등록일</div></th>
		      <th scope="col" class="notice-table-th-count"><div class="notice-table-td-child">조회</div></th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr class="notice-table-tr">
		      <td class="notice-table-td"><div class="notice-table-td-child">1</div></td>
		      <td class="notice-table-td"><div class="notice-table-td-child">공지사항</div></td>
		      <td class="notice-table-td"><div class="notice-table-td-child-title"><a href="/notice/detail">공지사항 입니다</a></div></td>
		      <td class="notice-table-td"><div class="notice-table-td-child">admin</div></td>
		      <td class="notice-table-td"><div class="notice-table-td-child">2023.11.16</div></td>
		      <td class="notice-table-td"><div class="notice-table-td-child">11</div></td>
		    </tr>
		    <tr class="notice-table-tr">
		      <td class="notice-table-td"><div class="notice-table-td-child">2</div></td>
		      <td class="notice-table-td"><div class="notice-table-td-child">이벤트</div></td>
		      <td class="notice-table-td"><div class="notice-table-td-child-title">이벤트 입니다</div></td>
		      <td class="notice-table-td"><div class="notice-table-td-child">admin</div></td>
		      <td class="notice-table-td"><div class="notice-table-td-child">2023.11.16</div></td>
		      <td class="notice-table-td"><div class="notice-table-td-child">22</div></td>
		    </tr>
		    <tr class="notice-table-tr">
		      <td class="notice-table-td"><div class="notice-table-td-child">3</div></td>	      
		      <td class="notice-table-td"><div class="notice-table-td-child">보도자료</div></td>
		      <td class="notice-table-td"><div class="notice-table-td-child-title">기사잘 떴습니다</div></td>
		      <td class="notice-table-td"><div class="notice-table-td-child">admin</div></td>
		      <td class="notice-table-td"><div class="notice-table-td-child">2023.11.16</div></td>
		      <td class="notice-table-td"><div class="notice-table-td-child">33</div></td>
		    </tr>
		  </tbody>
		</table>
		<a href="/notice/register">
		<button type="button">글작성</button>
		</a>
	</div>	
</div>
<jsp:include page="../common/footer.jsp" />
</body>
</html>