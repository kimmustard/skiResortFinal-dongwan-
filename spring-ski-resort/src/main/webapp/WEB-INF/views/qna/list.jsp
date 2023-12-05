<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../common/nav.jsp" />
<link rel="stylesheet" href="/resources/css/qna/qna_list.css">
</head>
<body>
<div class="qna-img-container" style="background-image: url('https://www.princehotels.com/shinfurano/wp-content/uploads/sites/40/2022/11/2022_11_1920_ski_2-1.jpg')">	</div>


<div class="container qna-container" id="qna-container">
<c:set value="${ph.pgvo.type }" var="typed"></c:set>
<div class="qna-h1">
	고객문의
	<p>Q&A</p>
</div>

	<div class="qna-menu-container">
		

		<!-- 검색 라인  -->
		<div class="qna-search-form">
			<form action="/qna/list" method="get">
			<div class="qna-search-container">
				<div class="dropdown qna-search-category">
				  <select class="qna-search-category dropdown-toggle" name="type" data-bs-toggle="dropdown" aria-expanded="false">
				   	<option class="dropdown-item" value="tcw" ${typed eq 'tc' ? 'selected' : '' }>전체</option>
				   	<option class="dropdown-item" value="t" ${typed eq 't' ? 'selected' : '' }>제목</option>
				   	<option class="dropdown-item" value="c" ${typed eq 'c' ? 'selected' : '' }>내용</option>
				  </select>
				</div>
				<div class="qna-input-container">
					<input placeholder="검색어를 입력해 주세요." name="keyword" type="search" value="" class="qna-search-input">
					<input type="hidden" name="pageNo" value="1">
					<input type="hidden" name="qty" value="${ph.pgvo.qty }">
				</div>
				<div class="qna-button-container">
					<button class="qna-search-button" type="submit">검색</button>
				</div>
			</div>
			</form>
		</div>
		
		
		<!-- 카테고리 라인 -->
		<div class="qna-category">
			<ul class="nav justify-content-center">
			  <li class="nav-item">
			  	<form action="/qna/list" method="get">
			  	<input type="hidden" name="type" value="g" ${typed eq 'g' ? 'selected' : '' }>
			  	<input type="hidden" name="keyword" type="search" value="">
			  	<button class="nav-link" type="submit">All</button>
			  	</form>
			  </li>
			  <li class="nav-item">
			  	<form action="/qna/list" method="get">
			  	<input type="hidden" name="type" value="g" ${typed eq 'g' ? 'selected' : '' }>
			  	<input type="hidden" name="keyword" type="search" value="스키장">
			  	<button class="nav-link" type="submit">Ski</button>
			  	</form>
			  </li>
			  <li class="nav-item">
			  	<form action="/qna/list" method="get">
			  	<input type="hidden" name="type" value="g" ${typed eq 'g' ? 'selected' : '' }>
			  	<input type="hidden" name="keyword" type="search" value="호텔">
			    <button class="nav-link" type="submit">Hotel</button>
			    </form>
			  </li>
			  <li class="nav-item">
			  	<form action="/qna/list" method="get">
			  	<input type="hidden" name="type" value="g" ${typed eq 'g' ? 'selected' : '' }>
			  	<input type="hidden" name="keyword" type="search" value="렌탈">
			    <button class="nav-link" type="submit">Rental</button>
			    </form>
			  </li>
			  <li class="nav-item">
			  	<form action="/qna/list" method="get">
			  	<input type="hidden" name="type" value="g" ${typed eq 'g' ? 'selected' : '' }>
			  	<input type="hidden" name="keyword" type="search" value="교통">
			    <button class="nav-link" type="submit">Traffic</button>
			    </form>
			  </li>
			  <li class="nav-item">
			  	<form action="/qna/list" method="get">
			  	<input type="hidden" name="type" value="g" ${typed eq 'g' ? 'selected' : '' }>
			  	<input type="hidden" name="keyword" type="search" value="예약">
			    <button class="nav-link" type="submit">Reservation</button>
			    </form>
			  </li>
			  <li class="nav-item">
			  	<form action="/qna/list" method="get">
			  	<input type="hidden" name="type" value="g" ${typed eq 'g' ? 'selected' : '' }>
			  	<input type="hidden" name="keyword" type="search" value="결제">
			    <button class="nav-link" type="submit">Payment</button>
			    </form>
			  </li>
			  <li class="nav-item">
			  	<form action="/qna/list" method="get">
			  	<input type="hidden" name="type" value="g" ${typed eq 'g' ? 'selected' : '' }>
			  	<input type="hidden" name="keyword" type="search" value="기타">
			    <button class="nav-link" type="submit">Other</button>
			    </form>
			  </li>
			</ul>
		</div>
		<br><br>
		
		
		<!-- 리스트 테이블 라인 -->
		<table class="table qna-table"  >
		  <thead >
		    <tr class="qna-table-tr">
		      <th scope="col" class="qna-table-th-no"><div class="qna-table-td-child">번호</div></th>
		      <th scope="col" class="qna-table-th-cago"><div class="qna-table-td-child">범주</div></th>
		      <th scope="col" class="qna-table-th-title"><div class="qna-table-td-child">제목</div></th>
		      <th scope="col" class="qna-table-th-isok"><div class="qna-table-td-child">상태</div></th>
		      <th scope="col" class="qna-table-th-reg"><div class="qna-table-td-child">등록일</div></th>
		    </tr>
		  </thead>
		  <tbody>
		  <c:forEach items="${list }" var="qvo">
		    <tr class="qna-table-tr">
		      <td class="qna-table-td"><div class="qna-table-td-child">${qvo.qnaNum }</div></td>
		      <td class="qna-table-td"><div class="qna-table-td-child">${qvo.qnaCategory }</div></td>
		      <td class="qna-table-td">
		      	<div class="qna-table-td-child-title">
		      		<c:if test="${qvo.qnaSecret=='N' }">
		      			<a href="/qna/detail?qnaNum=${qvo.qnaNum }">${qvo.qnaTitle }</a>
		      		</c:if>
		      		<c:if test="${qvo.qnaSecret=='Y' }">
		      			<p>※비밀글 입니다.</p>
		      		</c:if>
		      	</div></td>
		      <td class="qna-table-td"><div class="qna-table-td-child">${qvo.qnaIsok=='Y' ? '답변완료' : '접수중' }</div></td>
		      <td class="qna-table-td"><div class="qna-table-td-child">${fn:replace((fn:substring(qvo.qnaRegAt,0,10)),'-','.') }</div></td>
		    </tr>
		  </c:forEach>  
		  </tbody>
		</table>
		
		
		<!-- 페이징 라인 -->
		<div class="qna-paging-container">
		  <nav aria-label="Page navigation example">
		  	<!-- 이전 -->
		  	<ul class="pagination">
		  		<li class="page-item ${(ph.prev eq false) ? 'disabled' : '' }">
			  		<a class="page-link" href="/qna/list?pageNo=${ph.startPage - 1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}" aria-label="Previous">
			  		<span aria-hidden="true">&laquo;</span>
			  		</a>
		  		</li>
		  		<c:forEach begin="${ph.startPage }" end="${ph.endPage }" var="i">
  					<li>
  						<a class="page-link" href="/qna/list?pageNo=${i }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">${i }</a>
  					</li>
  				</c:forEach>
  			<!-- 다음 -->
  				<li class="page-item ${(ph.next eq false) ? 'disabled' : ''}">
  					<a class="page-link" href="/qna/list?pageNo=${ph.endPage + 1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}" aria-label="Next">
        			<span aria-hidden="true">&raquo;</span>
    				</a>
  				</li>	
		  	</ul>
		  </nav>
		</div>
		
		
		
		<!-- MY Q&A -->
		<div class="qna-reg">
		<sec:authorize access="isAuthenticated()"> <!-- 로그인 시 -->
			<sec:authentication property="principal.mvo.memberId" var="authId"/>
			<sec:authentication property="principal.mvo.memberEmail" var="authEmail"/>
			<sec:authentication property="principal.mvo.memberType" var="authType"/>
			<div class="qna-myqna">
				<form action="/qna/list" method="get">
					<c:if test="${authType == 'normal' }">
					  <input type="hidden" name="type" value="w" ${typed eq 'w' ? 'selected' : '' }>
					  <input type="hidden" name="keyword" type="search" value="${authId}">
					  <button class="btn btn-outline-success" type="submit">
					  MY Q&A</button>
					</c:if>

					<c:if test="${authType != 'normal' }">
					  <input type="hidden" name="type" value="w" ${typed eq 'w' ? 'selected' : '' }>
					  <input type="hidden" name="keyword" type="search" value="${authEmail }">
					 <button class="btn btn-outline-success" type="submit">
					  MY Q&A</button>
					</c:if>
				</form>	
			</div>
		</sec:authorize>
		
		<sec:authorize access="isAnonymous()"> <!-- 로그인 x -->
		<div class="qna-myqna">
			<form action="/qna/list" method="get">
				<input type="hidden" name="type" value="w" ${typed eq 'w' ? 'selected' : '' }>
				<input type="hidden" name="keyword" type="search" value="비회원">
				<button class="btn btn-outline-success" type="submit">
				MY Q&A</button>
			</form>
		</div>	
		</sec:authorize>
		
		<a href="/qna/register">
			<button class="btn btn-outline-dark type="button">문의하기</button>
		</a>
		</div>
		
		

	</div>			
</div>


<!-- 스크립트 라인  -->
<script type="text/javascript">
	
</script>


<jsp:include page="../common/footer.jsp" />
</body>
</html>