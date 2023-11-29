<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/notice/notice_list.css">
</head>
<body>
<jsp:include page="../common/nav.jsp" />
	<div class="notice-img-container" style="background-image: url('https://a.cdn-hotels.com/gdcs/production68/d766/4cc034a7-aeb1-4edd-b2a9-f7feaac49aec.jpg')">	
	</div>
	
<div class="container notice-container" id="notice-container">
<c:set value="${ph.pgvo.type }" var="typed"></c:set>

	<div class="notice-menu-container">
		<!-- 검색 라인  -->
		<form action="/notice/list" method="get">
		<div class="notice-search-container">
			<div class="dropdown notice-search-category">
			  <select class="notice-search-category dropdown-toggle" name="type" data-bs-toggle="dropdown" aria-expanded="false">
			   	<option class="dropdown-item" value="tcw" ${typed eq 'tcw' ? 'selected' : '' }>전체</option>
			   	<option class="dropdown-item" value="t" ${typed eq 't' ? 'selected' : '' }>제목</option>
			   	<option class="dropdown-item" value="c" ${typed eq 'c' ? 'selected' : '' }>내용</option>
			   	<option class="dropdown-item" value="w" ${typed eq 'w' ? 'selected' : '' }>작성자</option>
			  </select>
			  <!-- <button class="notice-search-category dropdown-toggle" name="type" type="button" data-bs-toggle="dropdown" aria-expanded="false">
			   		제목
			  </button>
			  <ul class="dropdown-menu">
			    <li class="dropdown-item">제목</li>
			    <li class="dropdown-item">내용</li>
			    <li class="dropdown-item">전체</li>
			  </ul> -->
			</div>
			<div class="notice-input-container">
				<input placeholder="검색어를 입력해 주세요." name="keyword" type="search" value="" class="notice-search-input">
				<input type="hidden" name="pageNo" value="1">
				<input type="hidden" name="qty" value="${ph.pgvo.qty }">
			</div>
			<div class="notice-button-container">
				<button class="notice-search-button" type="submit">검색</button>
			</div>
		</div>
		</form>
		

		<!-- 카테고리 라인 -->
		<div class="notice-category">
		<ul class="nav nav-tabs" id="myTab" role="tablist">	
			  <li class="nav-item" role="presentation">
			  	<form action="/notice/list" method="get">
			  	<input type="hidden" name="type" value="g" ${typed eq 'g' ? 'selected' : '' }>
			  	<input type="hidden" name="keyword" type="search" value="">
			    <button class="nav-link active" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="submit" role="tab" aria-controls="contact-tab-pane" aria-selected="false">
			    전체</button>
			    </form>
			  </li>
		  <li class="nav-item" role="presentation">
			  	<form action="/notice/list" method="get">
			  	<input type="hidden" name="type" value="g" ${typed eq 'g' ? 'selected' : '' }>
			  	<input type="hidden" name="keyword" type="search" value="공지사항"> 
			    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="submit" role="tab" aria-controls="contact-tab-pane" aria-selected="false">
			    공지사항</button>
			  	</form>
		  </li>
		  <li class="nav-item" role="presentation">
		  		<form action="/notice/list" method="get">
		  		<input type="hidden" name="type" value="g" ${typed eq 'g' ? 'selected' : '' }>
			  	<input type="hidden" name="keyword" type="search" value="이벤트">
			    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="submit" role="tab" aria-controls="contact-tab-pane" aria-selected="false">
			    이벤트</button>
			    </form>
		  </li>
		  <li class="nav-item" role="presentation">
		  		<form action="/notice/list" method="get">
		  		<input type="hidden" name="type" value="g" ${typed eq 'g' ? 'selected' : '' }>
			  	<input type="hidden" name="keyword" type="search" value="보도자료">
			    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="submit" role="tab" aria-controls="contact-tab-pane" aria-selected="false">
			    보도자료</button>
			    </form>
		  </li>
		  <li class="nav-item" role="presentation">
		  		<form action="/notice/list" method="get">
		  		<input type="hidden" name="type" value="g" ${typed eq 'g' ? 'selected' : '' }>
			  	<input type="hidden" name="keyword" type="search" value="쇼핑몰">
			    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="submit" role="tab" aria-controls="contact-tab-pane" aria-selected="false">
			    쇼핑몰</button>
			    </form>
		  </li>
		  <li class="nav-item" role="presentation">
		 		<form action="/notice/list" method="get">
		  		<input type="hidden" name="type" value="g" ${typed eq 'g' ? 'selected' : '' }>
			  	<input type="hidden" name="keyword" type="search" value="채용정보">
			    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="submit" role="tab" aria-controls="contact-tab-pane" aria-selected="false">
			    채용정보</button>
			    </form>
		  </li>
		  <li class="nav-item" role="presentation">
		  		<form action="/notice/list" method="get">
		  		<input type="hidden" name="type" value="g" ${typed eq 'g' ? 'selected' : '' }>
			  	<input type="hidden" name="keyword" type="search" value="기타">
			    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="submit" role="tab" aria-controls="contact-tab-pane" aria-selected="false">
			    기타</button>
			    </form>
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
		  <c:forEach items="${list }" var="nvo">
		    <tr class="notice-table-tr">
		      <td class="notice-table-td"><div class="notice-table-td-child">${nvo.noticeNum }</div></td>
		      <td class="notice-table-td"><div class="notice-table-td-child">${nvo.noticeCategory }</div></td>
		      <td class="notice-table-td"><div class="notice-table-td-child-title"><a href="/notice/detail?noticeNum=${nvo.noticeNum }">${nvo.noticeTitle }</a></div></td>
		      <td class="notice-table-td"><div class="notice-table-td-child">${nvo.noticeWriter }</div></td>
		      <td class="notice-table-td"><div class="notice-table-td-child">${fn:replace((fn:substring(nvo.noticeRegAt,0,10)),'-','.') }</div></td>
		      <td class="notice-table-td"><div class="notice-table-td-child">${nvo.noticeCount }</div></td>
		    </tr>
		  </c:forEach>  
		  </tbody>
		</table>
		
		
		<!-- 페이징 라인 -->
		  <nav aria-label="Page navigation example">
		  	<!-- 이전 -->
		  	<ul class="pagination">
		  		<li class="page-item ${(ph.prev eq false) ? 'disabled' : '' }">
			  		<a class="page-link" href="/notice/list?pageNo=${ph.startPage - 1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}" aria-label="Previous">
			  		<span aria-hidden="true">&laquo;</span>
			  		</a>
		  		</li>
		  		<c:forEach begin="${ph.startPage }" end="${ph.endPage }" var="i">
  					<li>
  						<a class="page-link" href="/notice/list?pageNo=${i }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">${i }</a>
  					</li>
  				</c:forEach>
  			<!-- 다음 -->
  				<li class="page-item ${(ph.next eq false) ? 'disabled' : ''}">
  					<a class="page-link" href="/notice/list?pageNo=${ph.endPage + 1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}" aria-label="Next">
        			<span aria-hidden="true">&raquo;</span>
    				</a>
  				</li>	
		  	</ul>
		  </nav>
		
		
		<br>
		
		<a href="/notice/register">
			<button type="button">글작성</button>
		</a>
	</div>	
</div>


<!-- 스크립트 라인  -->
<script type="text/javascript">

</script>
<script type="text/javascript" src="/resources/js/notice/noticeList.js"></script>

<jsp:include page="../common/footer.jsp" />
</body>
</html>