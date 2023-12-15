<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이스키 고객문의 레지스터</title>
<jsp:include page="../common/nav.jsp" />  
<link rel="stylesheet" href="/resources/css/qna/qna_register.css">
</head>
<body>
<!-- <div class="qna-img-container" style="background-image: url('https://www.princehotels.com/shinfurano/wp-content/uploads/sites/40/2022/11/2022_11_1920_ski_2-1.jpg')">	</div>
 -->
<c:set value="${qdto.qvo }" var="qvo"></c:set>
<c:set value="${qadto.qavo }" var="qavo"></c:set>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.mvo.authList" var="auths"/>
	<sec:authentication property="principal.mvo.memberId" var="authId"/>
	<sec:authentication property="principal.mvo.memberEmail" var="authEmail"/>
	<sec:authentication property="principal.mvo.memberType" var="authType"/>
</sec:authorize>
 
 
 
 
<div class="container qna-container">
<div class="qna-header qna-header-two">
	<h1 class="qna-header-h1">고객문의<span class="qna-header-span">Question And Answer</span></h1>
</div>   
<div class="qna-header-p">문의하신 부분에 대해 빠르고 정확한 답변을 드리겠습니다.</div>	


<div class="qna-menu-container">
	<div class="qna-menu-container-child">
	
	
	<form action="/qna/register" method="post" enctype="multipart/form-data">
		<table class="qna-table">
			<colgroup>
				<col style="width: 150px; background: #f8f8f8;">
				<col>
			</colgroup>
			<tbody>
				<tr class="qna-table-tr">
					<th class="qna-table-th">
					  <div class="qna-table-th-child">구분</div>
					</th>
					<td class="qna-table-td">
						<div class="mb-3 qna-table-td-child">
							<select class="form-select" name="qnaCategory" id="inputGroupSelect01">
								<option value="스키장">스키장</option>
								<option value="호텔">호텔</option>
								<option value="렌탈">렌탈</option>
								<option value="교통">교통</option>
								<option value="예약">예약</option>
								<option value="결제">결제</option>
								<option value="기타">기타</option>
							</select>
						</div>
					</td>
				</tr>
				<tr class="qna-table-tr">
					<th class="qna-table-th">
					  	<div class="qna-table-th-child">제목</div>
					</th>
					<td class="qna-table-td">
						<div class="mb-3 qna-table-td-child">
						  <input type="text" class="form-control" name="qnaTitle" id="exampleFormControlInput1" placeholder="제목은 30자 이내로 작성해 주세요." style="width: 600px;" maxlength="30">
						</div>  
					</td>	
				</tr>
				<tr class="qna-table-tr">
					<th class="qna-table-th">
					  	<div class="qna-table-th-child">작성자</div>
					</th>
					<td class="qna-table-td">
						<div class="mb-3 qna-table-td-child">
						  <sec:authorize access="isAuthenticated()">
							  <c:if test="${authType == 'normal' }">
							  	<input type="hidden" class="form-control" name="qnaWriter" id="exampleFormControlInput1" value="${authId }" readonly="readonly">
							  	<span style="padding: 10px;">${authId }</span>
							  </c:if>
							  <c:if test="${authType != 'normal' }">
							  	<input type="hidden" class="form-control" name="qnaWriter" id="exampleFormControlInput1" value="${authEmail }" readonly="readonly">
							  	<span style="padding: 10px;">${authEmail }</span>
							  </c:if>
						  </sec:authorize> 
						  <sec:authorize access="isAnonymous()"> <!-- 로그인 x -->
						  	<input type="hidden" class="form-control" name="qnaWriter" id="exampleFormControlInput1" value="비회원" readonly="readonly">
						  	<span style="padding: 10px;">비회원</span>
						  </sec:authorize>
						</div>
					</td>
				</tr>
				<tr class="qna-table-tr">
					<th class="qna-table-th">
					  	<div class="qna-table-th-child" id="qna-marchantUid">주문번호</div>
					</th>
					<td class="qna-table-td">
						<span class="mb-3 qna-table-td-uid">
						  <input type="text" class="form-control" name="qnaMerchantUid" id="qna-merchantUid"  placeholder="주문관련 문의사항 시 주문번호를 입력해주세요" style="width: 400px;">
						  
						</span>
						<span class="qna-table-td-uid-button">
							<button class="qna-uid-btn myqna-btn myqna-uid-btn" id="qna-merchantUid-btn" type="button">주문번호 확인</button>
						</span> 
						<br> 
						<div id="qna-table-errorMessage">
						
						</div>
						
					</td>	
				</tr>
				<tr class="qna-table-tr">
					<th class="qna-table-th">
					  	<div class="qna-table-th-child">문의내용</div>
					</th>
					<td class="qna-table-td">
						<div class="mb-3 qna-table-td-content">
						  <textarea id="textarea-board" class="form-control" name="qnaContent" rows="3" placeholder="내용은 1000자 이내로 작성해 주십시오." maxlength="1000"></textarea>
						</div>
					</td>
				</tr>
				<tr class="qna-table-tr">
					<th class="qna-table-th">
					  	<div class="qna-table-th-child">첨부파일</div>
					</th>
					<td class="qna-table-td">
						<div class="mb-3 qna-table-file">
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
				<tr>
					<th class="qna-table-th">
					  	<div class="qna-table-th-child">비밀글</div>
					</th>
					<td class="qna-table-td">
						<div class="mb-3 qna-table-td-child">
						  <input type="checkbox" name="qnaSecret" value="Y"><span> 비밀글 등록</span>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	
		
		<!-- 버튼 -->
		<div class="qna-detail-btn">
				<button type="submit" class="qna-btn myqna-btn" id="regBtn">등록</button>
			<a href="/qna/list">
				<button type="button" class="qna-btn myqna-btn">취소</button>
			</a>
		</div>
	</form>
	
	
	
	</div>
 </div>	
</div>


<script type="text/javascript" src="/resources/js/qna/qnaFileUpload.js"></script>
<script type="text/javascript" src="/resources/js/qna/qnaRegister.js"></script>

<script type="text/javascript">
		const isOk = `<c:out value="${isOk}"></c:out>`
		if(isOk=="2"){
			alert('제목을 입력해 주세요.');
		}
</script>
<jsp:include page="../common/footer.jsp" />
</body>
</html>