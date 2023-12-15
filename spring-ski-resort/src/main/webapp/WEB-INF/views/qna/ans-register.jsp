<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이스키 고객문의 답변등록</title>
<link rel="stylesheet" href="/resources/css/qna/qna-ans-register.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<jsp:include page="../common/nav.jsp" />
</head>
<body>
<c:set value="${qdto.qvo }" var="qvo"></c:set>
<c:set value="${qadto.qavo }" var="qavo"></c:set>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.mvo.authList" var="auths"/>
	<sec:authentication property="principal.mvo.memberId" var="authId"/>
	<sec:authentication property="principal.mvo.memberEmail" var="authEmail"/>
	<sec:authentication property="principal.mvo.memberType" var="authType"/>
</sec:authorize>



<!-- <div class="qna-img-container" style="background-image: url('https://www.princehotels.com/shinfurano/wp-content/uploads/sites/40/2022/11/2022_11_1920_ski_2-1.jpg')">	</div>
 -->	
<div class="container qna-container">
<div class="qna-header qna-header-two">
	<h1 class="qna-header-h1">고객문의<span class="qna-header-span">Question And Answer</span></h1>
</div>


<div class="qna-menu-container">
	<div class="qna-menu-container-child">

	<form action="/qna/ans-register" method="post" enctype="multipart/form-data">
	<table class="table qna-table">
		<thead class="table-secondary">
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
				  <c:if test="${qvo.qnaSecret=='Y' }">
			      	<c:if test="${(authType == 'normal' && authId == qvo.qnaWriter) || (authType != 'normal' && authEmail == qvo.qnaWriter) || auths.stream().anyMatch(authVO -> authVO.auth.equals('ROLE_ADMIN')).get()}">          
			      		<th scope="col" class="qna-table-th-title"><div class="qna-table-td-title"><span class="material-symbols-outlined" style="font-size: 21px">lock</span>${qvo.qnaTitle }</div></th>
			      	</c:if>
			      </c:if>
			      <c:if test="${qvo.qnaSecret=='N' }">
			      		<th scope="col" class="qna-table-th-title"><div class="qna-table-td-title">${qvo.qnaTitle }</div></th>
			      </c:if>
		      <td class="qna-table-td-category"><div class="qna-table-td-child-reg">${fn:replace((fn:substring(qvo.qnaRegAt,0,10)),'-','.') }</div></td>		      
		    </tr>
		</thead>
		<tbody>		
			<tr class="qna-table-tr">
				<td class="qna-table-td ">
			      	<div class="qna-table-td-child">
			      		<c:if test="${qvo.qnaIsok=='Y' }"><div class="qna-isok-y isok-line isok-end">답변완료</div></c:if>
			      		<c:if test="${qvo.qnaIsok=='N' }"><div class="qna-isok-n isok-line isok-end">대기중</div></c:if>
			      	</div>
		      	</td>
		      	<td class="qna-table-td qna-table-td-writer" colspan="2">
		      		<div class="qna-table-div-writer">${qvo.qnaWriter }</div>
		      	</td>
			</tr>			
			<!-- 내용 표시란 -->
			<tr>
				<td class="qna-table-content" colspan="3" style="padding: 30px 20px;">
					<div class="qna-table-content-child">${qvo.qnaContent }</div>
					<div>
					<div class="qna-table-content-child"> 주문번호 : <a id="member-merchantUid" data-merchantUid="${qvo.qnaMerchantUid }">${qvo.qnaMerchantUid}</a> </div>
						<!-- 파일표시란 -->
						<c:set value="${qdto.flist }" var="flist"></c:set>
						<ul class="list-group list-group-flush">
							<c:forEach items="${flist }" var="fvo">
								<li>
									<c:choose>
										<c:when test="${fvo.fileType > 0 }">
											<div class="qna-table-content-img-container">
											<img class="qna-table-content-img" alt="이미지x" src="/upload/${fn: replace(fvo.fileSave,'\\','/')}/${fvo.fileUuid}_${fvo.fileName}">
											</div>
										</c:when>
									</c:choose>
								</li>
							</c:forEach>
						</ul>
					</div>
				</td>
			</tr>
		
		
		<!-- 답변 등록 구간 -->


			<tr class="table-light qna-table-ans-head">
				<td class="" colspan="3">
					<div class="qna-table-td-child">답변등록 중..</div>
					<input type="hidden" name="qnaNum" value="${qvo.qnaNum}" readonly="readonly">
					<input type="hidden" name="qnaAnsTitle" value="${qvo.qnaTitle }">
					<sec:authorize access="isAuthenticated()"> <!-- 로그인 -->
						  <c:if test="${authType == 'normal' }">
						  	<input type="hidden" class="form-control" name="qnaAnsWriter" id="exampleFormControlInput1" value="${authId }" readonly="readonly">
						  </c:if>
						  <c:if test="${authType != 'normal' }">
						  	<input type="hidden" class="form-control" name="qnaAnsWriter" id="exampleFormControlInput1" value="${authEmail }" readonly="readonly">
						  </c:if>
					 </sec:authorize>
					 <sec:authorize access="isAnonymous()"> <!-- 로그인 x -->
					  	<input type="hidden" class="form-control" name="qnaAnsWriter" id="exampleFormControlInput1" value="관리자" readonly="readonly">
					 </sec:authorize>
				</td>
			</tr>
			<tr>	
				<td colspan="3" class="qna-table-ans-content">
					<div class="qna-table-ans-content-child">
						<textarea class="form-control" rows="5" cols="50"  name="qnaAnsContent" rows="5"></textarea>
					</div>
				</td>
			</tr>
				<colgroup>
					<col style="width: 150px;">
					<col>
				</colgroup>
			<tr class="qna-table-ans-tr">
				<th class="qna-table-ans-file" style="background-color: #f8f8f8;">
					<div class="qna-table-ans-file-child">첨부파일</div>
				</th>
				<td class="qna-table-ans-td">
					<div class="mb-3">
						  <input type="file" class="form-control" name="files" id="files" style="display: none;" multiple="multiple">
						  <!-- input button trigger 용도의 button -->
						  <button type="button" id="trigger" class="btn btn-outline-primary">첨부파일</button>
						  <span style="color: #ac0000;">※ 첨부파일은 20MB 이하의 png, gif, jpg 형식의 파일만 등록이 가능 합니다.</span>
						  <div class="mb-3" id="fileZone">
						  <!-- 첨부파일 표시 영역 -->
						  </div>
					</div>
				</td>
			</tr>	
	</tbody>
	</table>	
	
	
		<!-- 버튼 -->
		<div class="qna-detail-btn">		
			<c:if test="${auths.stream().anyMatch(authVO -> authVO.auth.equals('ROLE_ADMIN')).get()}">
				<c:if test="${qvo.qnaIsok=='N' }">	
						<a href="/qna/ans-register?qnaNum=${qvo.qnaNum }">
							<button type="submit" class="qna-btn myqna-btn" id="regBtn">답변등록</button>
						</a>
				</c:if>
			</c:if>	
			<a href="/qna/list">
				<button type="button" class="qna-btn myqna-btn">취소</button>
			</a>
			<a href="/developer/settingQna">
				<button type="button" class="qna-btn my-admin-btn">관리자페이지</button>
			</a>		
		</div>
	</form>
	
	  </div>
	</div>
</div>	 



<script type="text/javascript" src="/resources/js/qna/ansRegister.js"></script>
<script type="text/javascript" src="/resources/js/qna/qnaFileModify.js"></script>
<script type="text/javascript" src="/resources/js/qna/qnaFileUpload.js"></script>
<jsp:include page="../common/footer.jsp" />
</body>
</html>