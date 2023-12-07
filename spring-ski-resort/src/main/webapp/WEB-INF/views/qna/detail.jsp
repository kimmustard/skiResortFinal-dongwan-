<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이스키 고객문의 디테일</title>
<jsp:include page="../common/nav.jsp" />
<link rel="stylesheet" href="/resources/css/qna/qna_detail.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>

<body>
<c:set value="${qdto.qvo }" var="qvo"></c:set>
<c:set value="${qadto.qavo }" var="qavo"></c:set>
<sec:authorize access="isAuthenticated()">
<sec:authentication property="principal.mvo.authList" var="authList"/>
</sec:authorize>


<!-- <div class="qna-img-container" style="background-image: url('https://www.princehotels.com/shinfurano/wp-content/uploads/sites/40/2022/11/2022_11_1920_ski_2-1.jpg')">	</div>
 -->	
<div class="container qna-container">
<div class="qna-header qna-header-two">
	<h1 class="qna-header-h1">고객문의<span class="qna-header-span">Question And Answer</span></h1>
</div>



<div class="qna-menu-container">
	<div class="qna-menu-container-child">



	<table class="table qna-table">
		<thead class="table-light">
			<tr class="qna-table-tr">
				<td class="qna-table-td-category">
				      <div class="qna-table-td-child-category">
				      	<c:if test="${qvo.qnaCategory=='스키장' }">
					      	<span class="material-symbols-outlined qna-icon-ski" style="color: #004080;">downhill_skiing</span>
					      	<span class="qna-table-td-child-category-span" style="color: #004080;">${qvo.qnaCategory }</span>
				      	</c:if>
				      	<c:if test="${qvo.qnaCategory=='호텔' }">
					      	<span class="material-symbols-outlined" style="color: #934900;">location_city</span>
					      	<span class="qna-table-td-child-category-span" style="color: #934900;">${qvo.qnaCategory }</span>
				      	</c:if>
				      	<c:if test="${qvo.qnaCategory=='렌탈' }">
					      	<span class="material-symbols-outlined" style="color: #893436;">apparel</span>
					      	<span class="qna-table-td-child-category-span" style="color: #893436;">${qvo.qnaCategory }</span>
				      	</c:if>
				      	<c:if test="${qvo.qnaCategory=='교통' }">
					      	<span class="material-symbols-outlined" style="color: #34702e;">local_taxi</span>
					      	<span class="qna-table-td-child-category-span" style="color: #34702e;">${qvo.qnaCategory }</span>
				      	</c:if>
				      	<c:if test="${qvo.qnaCategory=='예약' }">
					      	<span class="material-symbols-outlined" style="color: #007575;">schedule</span>
					      	<span class="qna-table-td-child-category-span" style="color: #007575;">${qvo.qnaCategory }</span>
				      	</c:if>
				      	<c:if test="${qvo.qnaCategory=='결제' }">
					      	<span class="material-symbols-outlined" style="color: #b3a000;">credit_card</span>
					      	<span class="qna-table-td-child-category-span" style="color: #b3a000;">${qvo.qnaCategory }</span>
				      	</c:if>
				      	<c:if test="${qvo.qnaCategory=='기타' }">
					      	<span class="material-symbols-outlined" style="color: #472e50;">other_admission</span>
					      	<span class="qna-table-td-child-category-span" style="color: #472e50;">${qvo.qnaCategory }</span>
				      	</c:if>
				      </div>
			      </td>	      
		      <th scope="col" class="qna-table-th-title"><div class="qna-table-td-child">${qvo.qnaTitle }</div></th>
		      <td class="qna-table-td-category"><div class="qna-table-td-child-reg">${fn:replace((fn:substring(qvo.qnaRegAt,0,10)),'-','.') }</div></td>		      
		    </tr>
		</thead>
		<tbody>		
			<tr class="qna-table-tr">
				<td class="qna-table-td">
			      	<div class="qna-table-td-child">
			      		<c:if test="${qvo.qnaIsok=='Y' }"><div class="qna-isok-y isok-line isok-end">답변완료</div></c:if>
			      		<c:if test="${qvo.qnaIsok=='N' }"><div class="qna-isok-n isok-line isok-end">대기중</div></c:if>
			      	</div>
		      	</td>
		      	<td class="qna-table-td">
		      		<div class="qna-table-td-writer">${qvo.qnaWriter }</div>
		      	</td>
			</tr>			
			<!-- 내용 표시란 -->
			<tr>
				<td class="qna-table-content" colspan="3" style="padding: 30px 20px;">${qvo.qnaContent }
					<div>
						<!-- 파일표시란 -->
						<c:set value="${qdto.flist }" var="flist"></c:set>
						<ul class="list-group list-group-flush">
							<c:forEach items="${flist }" var="fvo">
								<li>
									<c:choose>
										<c:when test="${fvo.fileType > 0 }">
											<div>
											<img alt="이미지x" src="/upload/${fn: replace(fvo.fileSave,'\\','/')}/${fvo.fileUuid}_${fvo.fileName}">
											</div>
										</c:when>
									</c:choose>
								</li>
							</c:forEach>
						</ul>
					</div>
				</td>
			</tr>
		</tbody>

	</table>	
	
	
	
	
	<!-- Q&A 답변 라인 -->
	<c:if test="${qvo.qnaIsok == 'N' }">
		<p>※등록된 답변이 없습니다</p>
	</c:if>
	
	<c:if test="${qvo.qnaIsok == 'Y' }">
	<br>
	<table class="table table-hover">	
		<tr>
			<th>작성자</th>
			<td>${qavo.qnaAnsWriter }</td>
		</tr>	
		<tr>
			<th>등록일</th>
			<td>${qavo.qnaAnsRegAt }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${qavo.qnaAnsContent }
				<div>
					<!-- 파일표시란 -->
					<c:set value="${qadto.flist }" var="flistans"></c:set>
					<ul class="list-group list-group-flush">
						<c:forEach items="${flistans }" var="afvo">
							<li>
								<c:choose>
									<c:when test="${afvo.fileType > 0 }">
										<div>
										<img alt="이미지x" src="/upload/${fn: replace(afvo.fileSave,'\\','/')}/${afvo.fileUuid}_${afvo.fileName}">
										</div>
									</c:when>
								</c:choose>
							</li>
						</c:forEach>
					</ul>
				</div>
			</td>
		</tr>

	</table>
	</c:if>
	<br><br><br>
	
	<a href="/qna/list">
		<button type="button" class="btn btn-dark">리스트</button>
	</a>
	<a href="/qna/modify?qnaNum=${qvo.qnaNum }">
		<button type="button" class="btn btn-dark">수정</button>
	</a>
	<c:if test="${qvo.qnaIsok=='N' }">	
			<a href="/qna/ans-register?qnaNum=${qvo.qnaNum }">
				<button type="button" class="btn btn-primary">답변등록</button>
			</a>
	</c:if>
	<c:if test="${qvo.qnaIsok=='Y' }">	
			<a href="/qna/ans-modify?qnaNum=${qvo.qnaNum }">
				<button type="button" class="btn btn-warning">답변수정</button>
			</a>
	</c:if>
</div>


	</div>
</div>	


<jsp:include page="../common/footer.jsp" />	
</body>
</html>