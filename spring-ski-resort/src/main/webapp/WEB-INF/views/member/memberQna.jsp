<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
   <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이스키 회원 문의 내역</title>
<jsp:include page="../common/nav.jsp"></jsp:include>
<link  href="/resources/css/member/detail.css" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
 <sec:authorize access="isAuthenticated()"> <!-- 로그인 시 -->
			<sec:authentication property="principal.mvo.memberId" var="authId"/>
			<sec:authentication property="principal.mvo.memberEmail" var="authEmail"/>
			<sec:authentication property="principal.mvo.memberType" var="authType"/>
			<sec:authentication property="principal.mvo.authList" var="auths"/>
</sec:authorize>

<div class="bodyContainer">
	<div class="backgroundImgList">
	
	</div>
	<!-- 왼쪽 카테고리  -->
	<div class="mainCategory">
	<jsp:include page="../common/member_category.jsp"></jsp:include>
	</div>
	<!-- 오른쪽 메인화면 -->
	<div class="mainView">
		<div class="mainViewBody2">
			<div class="mainViewBox3">
				<div class="infoBox ibox6">
					<div class="iboxList iboxList2">
						<span>Q&A문의 내역</span>
					</div>
					<table class="table table-hover">
						<thead>
							<tr class="table-dark">
								<th style="width: 5%; border-left: 1px solid;">NO</th>
								<th style="width: 10%; border-left: 1px solid;">범주</th>
								<th style="border-left: 1px solid;">제목</th>
								<th style="width: 10%; border-left: 1px solid;">작성자</th>
								<th style="width: 10%; border-left: 1px solid;">답변상태</th>
								<th style="width: 15%; border-left: 1px solid;">등록일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="qvo">
								<c:if test="${(authType == 'normal' && authId == qvo.qnaWriter) || (authType != 'normal' && authEmail == qvo.qnaWriter)}">
									<tr class="tr-div">
										<td>${qvo.qnaNum }</td>
										<td>${qvo.qnaCategory }</td>
										<td >
											<c:if test="${qvo.qnaSecret=='N' }">
			      								<a style="text-decoration-line: none; color: black;" href="/qna/detail?qnaNum=${qvo.qnaNum }">${qvo.qnaTitle }</a>
			      							</c:if>
			      							<c:if test="${qvo.qnaSecret=='Y' }">
			      								<a style="text-decoration-line: none; color: black;" href="/qna/detail?qnaNum=${qvo.qnaNum }">${qvo.qnaTitle }</a>
												<span class="material-symbols-outlined" style="font-size: 21px">lock</span>
			      							</c:if>
										</td>
										<td>${qvo.qnaWriter }</td>
										<td>
											<c:if test="${qvo.qnaIsok=='Y' }">답변완료</c:if>
			      							<c:if test="${qvo.qnaIsok=='N' }">대기중</c:if>
										</td>
										<td>${qvo.qnaRegAt }</td>									
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
					<br><br>
					
						
					<!-- 페이징 라인 -->				
					<div class="qna-paging-container">
					  <nav aria-label="Page navigation example">
					  	<!-- 이전 -->
					  	<ul class="pagination qna-paging-ul">
					  		<li class="page-item ${(ph.prev eq false) ? 'disabled' : '' }">
						  		<a class="page-link" href="/member/memberQna?pageNo=${ph.startPage - 1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type='w'}&keyword=${ph.pgvo.keyword=authId}" aria-label="Previous">
						  		<span aria-hidden="true">&laquo;</span>
						  		</a>
					  		</li>
					  		<c:forEach begin="${ph.startPage }" end="${ph.endPage }" var="i">
			  					<li>
			  						<a class="page-link" href="/member/memberQna?pageNo=${i }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type='w'}&keyword=${ph.pgvo.keyword=authId}">${i }</a>
			  					</li>
			  				</c:forEach>
			  			<!-- 다음 -->
			  				<li class="page-item ${(ph.next eq false) ? 'disabled' : ''}">
			  					<a class="page-link" href="/member/memberQna?pageNo=${ph.endPage + 1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type='w'}&keyword=${ph.pgvo.keyword=authId}" aria-label="Next">
			        			<span aria-hidden="true">&raquo;</span>
			    				</a>
			  				</li>	
					  	</ul>
					  </nav>
					</div>
					
						
				</div>
				
				<!-- 버스 예약 내역 -->
				<div class="infoBox ibox6">
					<div class="iboxList iboxList2">
						<span>버스예약 내역</span>
					</div>
					<table class="table table-hover">
						<thead>
							<tr class="table-dark">
								<th style="width: 5%; border-left: 1px solid;">NO</th>
								<th style="width: 10%; border-left: 1px solid;">회원번호</th>
								<th style="width: 15%; border-left: 1px solid;">차량번호</th>
								<th style="width: 15%; border-left: 1px solid;">출발지역</th>
								<th style="width: 15%; border-left: 1px solid;">인원수</th>
								<th style="width: 25%; border-left: 1px solid;">예약상태</th>
								<th style="width: 15%; border-left: 1px solid;">예약신청일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${blist}" var="bvo">
								
								<tr class="tr-div">
									<td>${bvo.busReserveNum }</td>
									<td>${bvo.memberNum }</td>
									<td>${bvo.busNum }</td>
									<td>${bvo.busRegion }</td>
									<td>${bvo.busPeople }</td>
									<c:if test="${bvo.busCancel eq 'N' }">
										<td>
											예약완료
											<a href="/bus/cancel?busReserveNum=${bvo.busReserveNum}"><button type="button" id="busCancelBtn">예약취소</button></a>
										</td>
									</c:if>
									<c:if test="${bvo.busCancel eq 'Y' }">
										<td>
											예약취소
										</td>
									</c:if>
									<td>${bvo.busStartDate }</td>									
								</tr>
								
							</c:forEach>
						</tbody>
					</table>
					
						
					
					
						
				</div>
				
			</div>
				
		</div>
	</div>
</div>


<script type="text/javascript">
	const isOk = `<c:out value="${isOk}"/>`;
	if(isOk == 1){
		alert("이미 예약하셨습니다");
	}
</script>
</body>
</html>