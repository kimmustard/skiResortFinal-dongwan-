<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이스키 공지사항 디테일페이지</title>
<jsp:include page="../common/nav.jsp" />
<link rel="stylesheet" href="/resources/css/notice/notice_detail.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
<c:set value="${ndto.nvo }" var="nvo"></c:set>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.mvo.authList" var="auths"/>
	<sec:authentication property="principal.mvo.memberId" var="authId"/>
	<sec:authentication property="principal.mvo.memberEmail" var="authEmail"/>
	<sec:authentication property="principal.mvo.memberType" var="authType"/>
</sec:authorize>

<!-- <div class="notice-img-container" style="background-image: url('https://a.cdn-hotels.com/gdcs/production68/d766/4cc034a7-aeb1-4edd-b2a9-f7feaac49aec.jpg')">	</div>
 -->	
<!-- <div class="container notice-container"> -->
<div class="notice-header notice-header-two">
	<h1 class="notice-header-h1">${nvo.noticeCategory}<span class="notice-header-span"></span></h1>
</div>



<div class="notice-menu-container">
	<div class="notice-menu-container-child">
	
	<table class="table notice-table">
		<thead class="table-secondary">
			<tr class="notice-table-tr">
				<th scope="col" class="notice-table-th-title" colspan="2"><div class="notice-table-td-title">${nvo.noticeTitle }</div></th>
			</tr>
 		</thead>
 		<tbody>		
			<tr class="notice-table-tr">
				<td class="notice-table-td-category">
				      <div class="notice-table-td-child-category">
				      	${nvo.noticeCategory}
				      </div>
				</td>      	
		      	<td class="notice-table-td-category">
		      		<div class="notice-table-td-child-reg">${fn:replace((fn:substring(nvo.noticeRegAt,0,10)),'-','.') }</div>
		      	</td>
			</tr>
			<!-- 내용 표시란 -->
			<tr>
				<td class="notice-table-content" colspan="3" style="padding: 30px 20px;">
					<div class="notice-table-content-child">${nvo.noticeContent }</div>
					<div>
						<!-- 파일표시란 -->
						<c:set value="${ndto.flist }" var="flist"></c:set>
						<ul class="list-group list-group-flush">
							<c:forEach items="${flist }" var="fvo">
								<li>
									<c:choose>
										<c:when test="${fvo.fileType > 0 }">
											<div class="notice-table-content-img-container">
											<img class="notice-table-content-img" alt="이미지x" src="/upload/${fn: replace(fvo.fileSave,'\\','/')}/${fvo.fileUuid}_${fvo.fileName}">
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
	
	
	<!-- 버튼 -->
		<div class="notice-detail-btn">
			<a href="/notice/list">
				<button type="button" class="notice-btn mynotice-btn">목록</button>
			</a>
				<c:if test="${auths.stream().anyMatch(authVO -> authVO.auth.equals('ROLE_ADMIN')).get()}">			
					<a href="/notice/modify?noticeNum=${nvo.noticeNum }">
						<button type="button" class="notice-btn mynotice-btn">수정</button>
					</a>
				</c:if>	
		</div>	
	
 <!--  </div> -->	
 </div>	
</div>

	
	
	
<jsp:include page="../common/footer.jsp" />	
</body>
</html>