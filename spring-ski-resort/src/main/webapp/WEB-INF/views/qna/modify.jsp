<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이스크 고객문의 수정페이지</title>
<link rel="stylesheet" href="/resources/css/qna/qna_register.css">
<jsp:include page="../common/nav.jsp" />
</head>
<body>
<c:set value="${qdto.qvo }" var="qvo"></c:set>
<c:set value="${qadto.qavo }" var="qavo"></c:set>
<c:set value="${qdto.flist }" var="flist"></c:set>
<!-- <div class="qna-img-container" style="background-image: url('https://www.princehotels.com/shinfurano/wp-content/uploads/sites/40/2022/11/2022_11_1920_ski_2-1.jpg')">	</div>
 -->
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
	
	
	<form action="/qna/modify" method="post" enctype="multipart/form-data">
		<input type="hidden" name="qnaNum" value="${qvo.qnaNum}" readonly="readonly">
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
					  	<option ${qvo.qnaCategory ne null }>${qvo.qnaCategory }</option>
					  	<c:choose>
					  		<c:when test="${qvo.qnaCategory == '스키장'}">
					  		<option value="호텔">호텔</option>
					  		<option value="렌탈">렌탈</option>
					  		<option value="교통">교통</option>
					  		<option value="예약">예약</option>
					  		<option value="결제">결제</option>
					  		<option value="기타">기타</option>
					  		</c:when>
					  	</c:choose>
					  	<c:choose>
					  		<c:when test="${qvo.qnaCategory == '호텔'}">
					  		<option value="스키장">스키장</option>
					  		<option value="렌탈">렌탈</option>
					  		<option value="교통">교통</option>
					  		<option value="예약">예약</option>
					  		<option value="결제">결제</option>
					  		<option value="기타">기타</option>
					  		</c:when>
					  	</c:choose>
					  	<c:choose>
					  		<c:when test="${qvo.qnaCategory == '렌탈'}">
					  		<option value="스키장">스키장</option>
					  		<option value="호텔">호텔</option>
					  		<option value="교통">교통</option>
					  		<option value="예약">예약</option>
					  		<option value="결제">결제</option>
					  		<option value="기타">기타</option>
					  		</c:when>
					  	</c:choose>
					  	<c:choose>
					  		<c:when test="${qvo.qnaCategory == '교통'}">
					  		<option value="스키장">스키장</option>
					  		<option value="호텔">호텔</option>
					  		<option value="렌탈">렌탈</option>
					  		<option value="예약">예약</option>
					  		<option value="결제">결제</option>
					  		<option value="기타">기타</option>
					  		</c:when>
					  	</c:choose>
					  	<c:choose>
					  		<c:when test="${qvo.qnaCategory == '예약'}">
					  		<option value="스키장">스키장</option>
					  		<option value="호텔">호텔</option>
					  		<option value="렌탈">렌탈</option>
					  		<option value="교통">교통</option>
					  		<option value="결제">결제</option>
					  		<option value="기타">기타</option>
					  		</c:when>
					  	</c:choose>
					  	<c:choose>
					  		<c:when test="${qvo.qnaCategory == '결제'}">
					  		<option value="스키장">스키장</option>
					  		<option value="호텔">호텔</option>
					  		<option value="렌탈">렌탈</option>
					  		<option value="교통">교통</option>
					  		<option value="예약">예약</option>
					  		<option value="기타">기타</option>
					  		</c:when>
					  	</c:choose>
					  	<c:choose>
					  		<c:when test="${qvo.qnaCategory == '기타'}">
					  		<option value="스키장">스키장</option>
					  		<option value="호텔">호텔</option>
					  		<option value="렌탈">렌탈</option>
					  		<option value="교통">교통</option>
					  		<option value="예약">예약</option>
					  		<option value="결제">결제</option>
					  		</c:when>
					  	</c:choose>
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
							<input type="text" class="form-control" name="qnaTitle" value="${qvo.qnaTitle }" style="width: 600px;"   maxlength="30" placeholder="제목은 30자 이내로 작성해 주세요.">
						</div>
					</td>
				</tr>			
				<tr class="qna-table-tr">
					<th class="qna-table-th">
					  	<div class="qna-table-th-child">작성자</div>
					</th>
					<td class="qna-table-td">
						<div class="mb-3 qna-table-td-child">
							<input type="hidden" name="qnaWriter">
							<span style="padding: 10px;">${qvo.qnaWriter }</span>
						</div>
					</td>
				</tr>	
				<tr class="qna-table-tr">
					<th class="qna-table-th">
					  	<div class="qna-table-th-child">문의내용</div>
					</th>
					<td class="qna-table-td">
						<div class="mb-3 qna-table-td-content">
						  <textarea class="form-control" name="qnaContent" rows="3" placeholder="내용은 1000자 이내로 작성해 주십시오." maxlength="1000">${qvo.qnaContent }</textarea>
						</div>
					</td>
				</tr>
				<tr class="qna-table-tr">
					<th class="qna-table-th">
					  	<div class="qna-table-th-child">등록일</div>
					</th>
					<td class="qna-table-td">
						<div class="mb-3 qna-table-td-child">
							<input type="hidden" name="qnaWriter">${qvo.qnaRegAt }
						</div>
					</td>
				</tr>
				<tr class="qna-table-tr">
					<th class="qna-table-th">
					  	<div class="qna-table-th-child">수정일</div>
					</th>
					<td class="qna-table-td">
						<div class="mb-3 qna-table-td-child">
							<input type="hidden" name="qnaWriter">${qvo.qnaModAt }
						</div>
					</td>	
				</tr>
				<tr class="qna-table-tr">
					<th class="qna-table-th">
					  	<div class="qna-table-th-child">첨부파일</div>
					</th>
					<td class="qna-table-td">
						<div class="mb-3 qna-table-file">
							<ul>
								<c:forEach items="${flist }" var="fvo">
									<li>
										<c:choose>
											<c:when test="${fvo.fileType > 0 }">
												<div>
													<img alt="그림이 없음." src="/upload/${fn: replace(fvo.fileSave,'\\','/')}/${fvo.fileUuid}_th_${fvo.fileName}">
												</div>
											</c:when>
										</c:choose>
										<div>
											<div><B>${fvo.fileName }</B></div>
								 			<div class="badge text-bg-secondary">${fvo.fileRegAt }</div>
								 		</div>
								 		<span class="badge rounded-pill text-bg-success">${fvo.fileSize }Byte</span>
								 		<div>
								 			<button type="button" class="file-x btn btn-outline-secondary" data-uuid="${fvo.fileUuid }">X</button>
										</div>
										<br>
									</li>
								</c:forEach>
							</ul>
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
						<div class="mb-3 qna-table-td-child" id="qna-secret-div">
						  <input type="checkbox" name="qnaSecret" value="Y" id="qna-secret"><span> 비밀글 등록</span>
						  <input type="hidden" name="qnaSecret" value="N" id="qna-secret-hidden">
						</div>
					</td>
				</tr>	
			

		</tbody>	
		</table>	

		<div class="qna-detail-btn">
			<button type="submit" class="qna-btn myqna-btn" id="regBtn">수정완료</button>
			<a href="/qna/list"><button type="button" class="qna-btn myqna-btn">취소</button></a>
			<a href="/qna/remove?qnaNum=${qvo.qnaNum }">
			<button type="button" class="qna-btn myqna-btn-delete">삭제하기</button>
			</a>
		</div>			
	</form>
	
	
  </div>
 </div>
</div>




<script type="text/javascript" src="/resources/js/qna/qnaFileModify.js"></script>
<script type="text/javascript" src="/resources/js/qna/qnaFileUpload.js"></script>	   
<script type="text/javascript">
const qnaSecret = `<c:out value="${qvo.qnaSecret}" />`;
</script>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
    
    var Secret = `<c:out value="${qvo.qnaSecret}" />`;
    // 체크박스 요소 가져오기
    var qnaSecretCheckbox = document.getElementById('qna-secret');

    // qnaSecret 값이 'Y'이면 체크, 'N'이면 해제
    if (qnaSecretCheckbox) {
        qnaSecretCheckbox.checked = Secret === 'Y';

        // 체크박스 상태가 변경될 때 이벤트 리스너 등록
        qnaSecretCheckbox.addEventListener('change', function() {
            // 체크박스가 체크되어 있으면 'Y', 그렇지 않으면 'N' 설정
            Secret = qnaSecretCheckbox.checked ? 'Y' : 'N';
            
    	}) 
    } 
    
    document.getElementById('qna-secret').addEventListener('click',()=>{
    	const checkBox =  document.getElementById('qna-secret');
    	const checkBoxHidden = document.getElementById('qna-secret-hidden');
    	
    	
    	if(checkBox.checked){
    		checkBoxHidden.disabled = true;
    		console.log(checkBoxHidden);
    	}else{
    		checkBoxHidden.disabled = false;
    		console.log(checkBoxHidden);
    	}
    	
    })
    
    

		/* document.getElementById('qna-secret').addEventListener('click',()=>{
	    if(Secret==='N'){
	        let div = document.getElementById('qna-secret-div');
	        div.innerHTML = `<input type="checkbox" name="qnaSecret" value="N" id="qna-secret"><span> 비밀글 등록 N</span>`;
            console.log(Secret);
	    }else if(Secret==='Y'){
	    	let div = document.getElementById('qna-secret-div');
            div.innerHTML = `<input type="checkbox" name="qnaSecret" value="Y" id="qna-secret"><span> 비밀글 등록 Y</span>`;
            console.log(Secret);
	    }
	}) */
});
</script>

<script type="text/javascript">
		const isOk = `<c:out value="${isOk}"></c:out>`
		if(isOk=="2"){
			alert('제목을 입력해 주세요.');
		}
</script>
	   
<jsp:include page="../common/footer.jsp" />	

</body>
</html>