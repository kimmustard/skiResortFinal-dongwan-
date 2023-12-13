<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객문의 관리자 게시판</title>
<link  href="/resources/css/developer/setting.css" rel="stylesheet">
<link  href="/resources/css/developer/devQna.css" rel="stylesheet">
</head>
<body>
	<div class="devMainContainer">
		<div class="devNav">
			<div class="marquee marquee1">
				  <p class="marquee-text"><img alt="" height="50" src="/resources/etc/line.png"></p>
				</div>
			
		</div>
		
		<div class="devBody">
			
			<jsp:include page="../common/devCategory.jsp"></jsp:include>
			
					<div class="mmmmainContainer dev-container">
					<!-- 각자 페이지 개발구역 -->
					<div class="dev-qna-container">
						<div class="dev-qna-regbtn-container">

						</div>
						
						
						<!-- Q&A 목록 테이블 라인 -->
						<div class="accordion accordion-flush" id="accordionFlushExample">
						
						
						<!--답변 미등록 문의 게시글 목록 -->
						  <div class="accordion" id="accordionPanelsStayOpenExample">
						   <div class="accordion-item">
						    <h2 class="accordion-header">
    						  <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
						        답변 미등록 문의 게시글 목록 (총 <span style="color: red;">${ph.totalCount }</span>개)
						      </button>
						    </h2>
						    <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show">
      						  <div class="accordion-body" style="background-color: rgb(208 208 208);">
						      
						      	<!-- 검색 라인  -->		      	
								<div class="container-fluid">
									<form action="/developer/settingQna" class="d-flex" role="search" method="get">
										<div class="dropdown btn-group">
										  <select class="dropdown-toggle" name="type" data-bs-toggle="dropdown" aria-expanded="false">
										   	<option class="dropdown-item" value="tcw" ${typed eq 'tcw' ? 'selected' : '' }>전체</option>
										   	<option class="dropdown-item" value="t" ${typed eq 't' ? 'selected' : '' }>제목</option>
										   	<option class="dropdown-item" value="c" ${typed eq 'c' ? 'selected' : '' }>내용</option>
										   	<option class="dropdown-item" value="w" ${typed eq 'w' ? 'selected' : '' }>작성자</option>
										  </select>
										</div>
										<div class="">
											<input placeholder="검색어를 입력해 주세요." name="keyword" type="search" value="" class="form-control me-2">
											<input type="hidden" name="pageNo" value="1">
											<input type="hidden" name="qty" value="${ph.pgvo.qty }">
										</div>
											<button class="btn btn-primary" type="submit"><div>검색</div></button>
									</form>
								</div><br>			      
						 
						      	<!-- 테이블 라인 -->
						      	<table class="table table-dark table-hover">
								  <thead>
								    <tr class="dev-qna-tr">
								      <th scope="col" class="dev-qna-no">No.</th>
								      <th scope="col" class="dev-qna-category">Q&A 분류</th>
								      <th scope="col" class="dev-qna-title">Q&A 제목</th>
								      <th scope="col" class="dev-qna-writer">작성자</th>
								      <th scope="col" class="dev-qna-isok">답변여부</th>
								      <th scope="col" class="dev-qna-reg">작성일시</th>
								      <th scope="col" class="dev-qna-modify">Q&A 관리</th>
								    </tr>
								  </thead>
								  <tbody>
								  	<c:forEach items="${list }" var="qvo">
								    <tr class="dev-qna-tr">
								      <td>${qvo.qnaNum }</td>
								      <td>${qvo.qnaCategory }</td>
								      <td class="dev-qna-title-td"><div><a href="/qna/detail?qnaNum=${qvo.qnaNum }">${qvo.qnaTitle }</a></div></td>
								      <td style="color: #8080ff; font-weight: 600;">
									      <a href="/developer/settingQnaMember">
									      ${qvo.qnaWriter }
									      </a>
								      </td>
								      <td>
								      	<c:if test="${qvo.qnaIsok == 'N' }"><span style="color: #800000">${qvo.qnaIsok }</span></c:if>
								      	<c:if test="${qvo.qnaIsok == 'Y' }"><span style="color: #0080ff">${qvo.qnaIsok }</span></c:if>
								      </td>
								      <td>${fn:replace((fn:substring(qvo.qnaRegAt,0,10)),'-','.') }</td>
								      <td>
								      	<c:if test="${qvo.qnaIsok == 'N' }">
									      	<a href="/qna/ans-register?qnaNum=${qvo.qnaNum }">
												<button type="button" class="btn btn-warning">답변등록</button>
											</a>
								      	</c:if>
								      	<c:if test="${qvo.qnaIsok == 'Y' }">
									      	<a href="/qna/ans-modify?qnaNum=${qvo.qnaNum }">
												<button type="button" class="btn btn-warning">답변수정</button>
											</a>
								      	</c:if>
										<a href="/developer/qnaRemove?qnaNum=${qvo.qnaNum }">
											<button type="button" class="btn btn-danger">삭제</button>
										</a>
								      </td>
								    </tr>
								    </c:forEach>
								  </tbody>
								</table>
								
								<br>
					
								<!-- 페이징 라인 -->
								<div class="qna-paging-container">
								  <nav aria-label="Page navigation example">
								  	<!-- 이전 -->
								  	<ul class="pagination qna-paging-ul">
								  		<li class="page-item ${(ph.prev eq false) ? 'disabled' : '' }">
									  		<a class="page-link" href="/developer/settingQna?pageNo=${ph.startPage - 1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}" aria-label="Previous">
									  		<span aria-hidden="true">&laquo;</span>
									  		</a>
								  		</li>
								  		<c:forEach begin="${ph.startPage }" end="${ph.endPage }" var="i">
						  					<li>
						  						<a class="page-link" href="/developer/settingQna?pageNo=${i }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">${i }</a>
						  					</li>
						  				</c:forEach>
						  			<!-- 다음 -->
						  				<li class="page-item ${(ph.next eq false) ? 'disabled' : ''}">
						  					<a class="page-link" href="/developer/settingQna?pageNo=${ph.endPage + 1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}" aria-label="Next">
						        			<span aria-hidden="true">&raquo;</span>
						    				</a>
						  				</li>	
								  	</ul>
								  </nav>
								</div>
								
						      </div>
						    </div>
						  </div>
						
						
						<!--전체 문의 게시글 목록 -->
						  <div class="accordion-item">
    						<h2 class="accordion-header">
      						  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
						        문의 게시글 목록 (총 <span style="color: red;">${ph.totalCount }</span>개)
						      </button>
						    </h2>
						    <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse show">
      							<div class="accordion-body" style="background-color: rgb(208 208 208);">
						    
						      	<!-- 검색 라인  -->		      	
								<div class="container-fluid">
									<form action="/developer/settingQna" class="d-flex" role="search" method="get">
										<div class="dropdown btn-group">
										  <select class="dropdown-toggle" name="type" data-bs-toggle="dropdown" aria-expanded="false">
										   	<option class="dropdown-item" value="tcw" ${typed eq 'tcw' ? 'selected' : '' }>전체</option>
										   	<option class="dropdown-item" value="t" ${typed eq 't' ? 'selected' : '' }>제목</option>
										   	<option class="dropdown-item" value="c" ${typed eq 'c' ? 'selected' : '' }>내용</option>
										   	<option class="dropdown-item" value="w" ${typed eq 'w' ? 'selected' : '' }>작성자</option>
										  </select>
										</div>
										<div class="">
											<input placeholder="검색어를 입력해 주세요." name="keyword" type="search" value="" class="form-control me-2">
											<input type="hidden" name="pageNo" value="1">
											<input type="hidden" name="qty" value="${ph.pgvo.qty }">
										</div>
											<button class="btn btn-primary" type="submit"><div>검색</div></button>
									</form>
								</div><br>			      
						 
						      	<!-- 테이블 라인 -->
						      	<table class="table table-hover">
								  <thead>
								    <tr class="dev-qna-tr">
								      <th scope="col" class="dev-qna-no">No.</th>
								      <th scope="col" class="dev-qna-category">Q&A 분류</th>
								      <th scope="col" class="dev-qna-title">Q&A 제목</th>
								      <th scope="col" class="dev-qna-writer">작성자</th>
								      <th scope="col" class="dev-qna-isok">답변여부</th>
								      <th scope="col" class="dev-qna-reg">작성일시</th>
								      <th scope="col" class="dev-qna-modify">Q&A 관리</th>
								    </tr>
								  </thead>
								  <tbody>
								  	<c:forEach items="${list }" var="qvo">
								    <tr class="dev-qna-tr">
								      <td>${qvo.qnaNum }</td>
								      <td>${qvo.qnaCategory }</td>
								      <td class="dev-qna-title-td"><div><a href="/qna/detail?qnaNum=${qvo.qnaNum }">${qvo.qnaTitle }</a></div></td>
								      <td style="color: #0000d5; font-weight: 600;">
									      <a href="/developer/settingQnaMember">
									      ${qvo.qnaWriter }
									      </a>
								      </td>
								      <td>
								      	<c:if test="${qvo.qnaIsok == 'N' }"><span style="color: #800000">${qvo.qnaIsok }</span></c:if>
								      	<c:if test="${qvo.qnaIsok == 'Y' }"><span style="color: #0080ff">${qvo.qnaIsok }</span></c:if>
								      </td>
								      <td>${fn:replace((fn:substring(qvo.qnaRegAt,0,10)),'-','.') }</td>
								      <td>
								      	<c:if test="${qvo.qnaIsok == 'N' }">
									      	<a href="/qna/ans-register?qnaNum=${qvo.qnaNum }">
												<button type="button" class="btn btn-warning">답변등록</button>
											</a>
								      	</c:if>
								      	<c:if test="${qvo.qnaIsok == 'Y' }">
									      	<a href="/qna/ans-modify?qnaNum=${qvo.qnaNum }">
												<button type="button" class="btn btn-warning">답변수정</button>
											</a>
								      	</c:if>
										<a href="/developer/qnaRemove?qnaNum=${qvo.qnaNum }">
											<button type="button" class="btn btn-danger">삭제</button>
										</a>
								      </td>
								    </tr>
								    </c:forEach>
								  </tbody>
								</table>
								
								<br>
					
								<!-- 페이징 라인 -->
								<div class="qna-paging-container">
								  <nav aria-label="Page navigation example">
								  	<!-- 이전 -->
								  	<ul class="pagination qna-paging-ul">
								  		<li class="page-item ${(ph.prev eq false) ? 'disabled' : '' }">
									  		<a class="page-link" href="/developer/settingQna?pageNo=${ph.startPage - 1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}" aria-label="Previous">
									  		<span aria-hidden="true">&laquo;</span>
									  		</a>
								  		</li>
								  		<c:forEach begin="${ph.startPage }" end="${ph.endPage }" var="i">
						  					<li>
						  						<a class="page-link" href="/developer/settingQna?pageNo=${i }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">${i }</a>
						  					</li>
						  				</c:forEach>
						  			<!-- 다음 -->
						  				<li class="page-item ${(ph.next eq false) ? 'disabled' : ''}">
						  					<a class="page-link" href="/developer/settingQna?pageNo=${ph.endPage + 1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}" aria-label="Next">
						        			<span aria-hidden="true">&raquo;</span>
						    				</a>
						  				</li>	
								  	</ul>
								  </nav>
								</div>
								
						      </div>
						    </div>
						  </div>  
						</div>
						
			
					</div>
				</div>
			

		</div>
	</div>
</div>	
	<script type="text/javascript" src="/resources/js/developer/setting.js"></script>
</body>
</html>