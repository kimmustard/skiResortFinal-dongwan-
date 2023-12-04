<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
   <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<jsp:include page="../common/nav.jsp"></jsp:include>
<link  href="/resources/css/member/detail.css" rel="stylesheet">
</head>
<body>
	
	<div class="bodyContainer">
	<div class="backgroundImg">
	
	</div>
		<!-- 왼쪽 카테고리  -->
		<div class="mainCategory">
			<jsp:include page="../common/member_category.jsp"></jsp:include>
		</div>
		
		<!-- 오른쪽 메인화면 -->
		<div class="mainView">
			<div class="mainViewBody1">
				<div class="mainViewBox1">
					<form:form action="/member/detail" modelAttribute="mDTO" method="post">
						<div class="modifyViewBox">
							<sec:authorize access="isAuthenticated()">
				        	<sec:authentication property="principal.mvo.memberId" var="authId"/>
				        	<sec:authentication property="principal.mvo.memberEmail" var="authEmail"/>
				        	<sec:authentication property="principal.mvo.memberAlias" var="authAlias"/>
				        	<sec:authentication property="principal.mvo.memberType" var="authType"/>
						
							<c:if test="${authType == 'normal' }">
							<div class="modifyBox modifyTitle">
								<div class="member-msg">
									<h3>회원정보 수정</h3>
									<span class="sb1-span">회원님은 일반회원입니다.</span>
								</div>
							</div>
	
							<div class="modifyBox fbox1">
								<label for="memberId" class="sb1-span" onclick="focusInput('sb1-input1')">아이디</label><br>
								<input class="sb1-input" id="sb1-input1" name="memberId" value="${mvo.memberId }" readonly="readonly">
								<i class="bi bi-lock-fill"></i>
								<input type="hidden" name="memberType" value=${mvo.memberType }>
							</div>
							<div class="modifyBox fbox2">
								<label for="sb1-input2" class="sb1-span" onclick="focusInput('sb1-input2')">이름</label><br>
								<input class="sb1-input" id="sb1-input2" value="${mvo.memberName }" readonly="readonly">
								<i class="bi bi-lock-fill"></i>
							</div>
							<div class="modifyBox fbox3">
								<label for="memberAlias" class="sb1-span" onclick="focusInput('sb1-input3')">별명</label><br>
								<form:input class="sb1-input" path="memberAlias" id="sb1-input3" name="memberAlias" value="${mvo.memberAlias }" />
								<br><form:errors class="errorFont" path="memberAlias"></form:errors>
							</div>
							<div class="modifyBox fbox4">
								<label for="inputMemberEmail" class="sb1-span" onclick="focusInput('sb1-input4')">이메일</label><br>
								<form:input class="sb1-input" id="inputMemberEmail" path="memberEmail" name="memberEmail" value="${mvo.memberEmail }" readonly="readonly" />
								<br><form:errors class="errorFont" path="memberEmail"></form:errors>
								<button type="button" class="btn btn-primary" id="MemberEmailCheck" data-bs-toggle="modal" data-bs-target="#staticBackdrop" style="display: none;">
							 		이메일 인증
							 	</button>
							</div>
							<div class="modifyBox fbox5">
								<label for="sb1-input5" class="sb1-span" onclick="focusInput('sb1-input2')">핸드폰번호</label><br>
								<form:input class="sb1-input" id="sb1-input5" path="memberPhoneNum" name="memberPhoneNum" value="${mvo.memberPhoneNum }" />
								<br><form:errors class="errorFont" path="memberPhoneNum"></form:errors>
							</div>
							<div class="modifyBox fbox6">
								<label for="inputMemberAddress" class="sb1-span" onclick="focusInput('sb1-input2')">주소</label><br>
								<input type="hidden" id="inputMemberPostcode">
								<form:input class="sb1-input" path="memberAddress" id="inputMemberAddress" name="memberAddress" onclick="clickAddr()" value="${mvo.memberAddress }" />
								<br><form:errors class="errorFont" path="memberAddress"></form:errors>
								<button class="btn btn-primary" type="button"  id="button-addon2" onclick="sample6_execDaumPostcode()" style="display: none;" >주소 찾기</button>
							</div>
							<div class="modifyBox fbox7">
								<label for="inputMemberAddressDetail" class="sb1-span" onclick="focusInput('sb1-input3')">상세주소</label><br>
								<input class="sb1-input" id="inputMemberAddressDetail" name="memberAddressDetail" value="${mvo.memberAddressDetail}">
							</div>
							</c:if>
							<c:if test="${authType != 'normal' }">
							<div class="modifyBox modifyTitle">
								<div class="member-msg">
									<h3>회원정보 수정</h3>
									<span class="sb1-span">회원님은 소셜(${mvo.memberType})회원입니다.</span>
								</div>
							</div>
							<div class="modifyBox fbox1">
								<input type="hidden" name="memberId" value=${mvo.memberId }>
								<input type="hidden" name="memberType" value=${mvo.memberType }>
								<label for="sb1-input1" class="sb1-span" onclick="focusInput('sb1-input1')">아이디</label><br>
								<input class="sb1-input" id="sb1-input1" name="memberEmail" value="${mvo.memberEmail }" readonly="readonly">
							</div>
							<div class="modifyBox fbox2">
								<label for="sb1-input2" class="sb1-span" onclick="focusInput('sb1-input2')">이름</label><br>
								<input class="sb1-input" id="sb1-input2" value="${mvo.memberName }" readonly="readonly">
							</div>
							<div class="modifyBox fbox3">
								<label for="sb1-input3" class="sb1-span" onclick="focusInput('sb1-input3')">별명</label><br>
								<form:input class="sb1-input" path="memberAlias" id="sb1-input3" name="memberAlias" value="${mvo.memberAlias }" />
								<br><form:errors class="errorFont" path="memberAlias"></form:errors>
							</div>
							<div class="modifyBox fbox4">
								<label for="sb1-input4" class="sb1-span" onclick="focusInput('sb1-input2')">
									핸드폰번호
									<c:if test="${authType == 'google'}">
										<small style="color: black"> ( ※ 구글 회원은 반드시 핸드폰번호를 기입해주세요. )</small>
									</c:if>
								</label><br>
								<form:input class="sb1-input" id="sb1-input5" path="memberPhoneNum" name="memberPhoneNum" value="${mvo.memberPhoneNum }" />
								<br><form:errors class="errorFont" path="memberPhoneNum"></form:errors><br>
							</div>
							<div class="modifyBox fbox5">
								<label for="inputMemberAddress" class="sb1-span" onclick="focusInput('sb1-input2')">주소</label><br>
								<input type="hidden" id="inputMemberPostcode">
								<form:input class="sb1-input" path="memberAddress" id="inputMemberAddress" name="memberAddress" onclick="clickAddr()" value="${mvo.memberAddress }" />
								<br><form:errors class="errorFont" path="memberAddress"></form:errors>
								<button class="btn btn-primary" type="button"  id="button-addon2" onclick="sample6_execDaumPostcode()" style="display: none;" >주소 찾기</button>
							</div>
							<div class="modifyBox fbox6">
								<label for="inputMemberAddressDetail" class="sb1-span" onclick="focusInput('sb1-input3')">상세주소</label><br>
								<input class="sb1-input" id="inputMemberAddressDetail" name="memberAddressDetail" value="${mvo.memberAddressDetail}" placeholder="상세주소를 입력해주세요.">
							</div>
							</c:if>
							</sec:authorize>
						<div class="modify-btn">
							<button type="submit" class="btn btn-primary">수정하기</button> 
						</div>
						</div>
					</form:form>
				</div>
			</div>
			
	</div>	
</div>




	<!-- 이메일 인증 팝업 -->
	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog" tabindex="-1">
		    <div class="modal-content" tabindex="-1">
		      <div class="modal-header" tabindex="-1">
		        <h1 class="modal-title fs-5" id="staticBackdropLabel" tabindex="-1">이메일 변경하기</h1>
		        <button type="button" class="btn-close" id="modalClose" data-bs-dismiss="modal" aria-label="Close" tabindex="-1"></button>
		      </div>
		      <div class="modal-body" tabindex="-1">
		        <div class="form-group registerBox rb-5" tabindex="-1">
				     <label for="modalEmailCheck" class="form-label mt-4" tabindex="-1">Email</label>
				     <div class="input-group mb-3" tabindex="-1">
					     <input type="email" class="form-control" id="modalEmailCheck" aria-describedby="emailHelp" placeholder="이메일"  tabindex="-1" />
					     <button type="button" class="btn btn-primary" id="modalEmailCheckBtn" tabindex="-1">
						 	인증번호 받기
						 </button>
				  		 </div>
					 <div id="emailDuplicateCheck" tabindex="-1"></div>
		      </div>
		      <div class="modal-body" id="modal-body2" tabindex="-1">
		       
		      </div>
		      <div class="modal-footer" tabindex="-1">
		        <input type="button" class="btn btn-primary" id="emailCheckSuccess" value="인증완료" tabindex="-1">
		      </div>
		    </div>
		  </div>
		</div>

	</div>
	
<script>
	function focusInput(inputId) {
	    // 라벨 클릭시 인풋창 뒤로 focus하게하는 스크립트
	    var inputElement = document.getElementById(inputId);
	    inputElement.focus();
	    inputElement.setSelectionRange(inputElement.value.length, inputElement.value.length);
	}
</script>

<!-- 주소 scrpit -->
<script type="text/javascript" src="/resources/js/member/MemberDetail.js"></script>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/js/member/MemberAddress.js"></script>

</body>
</html>