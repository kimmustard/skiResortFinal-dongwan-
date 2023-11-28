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
<link  href="/resources/css/member/detail.css" rel="stylesheet">
</head>
<body>
	
<jsp:include page="../common/nav.jsp"></jsp:include>

	<div class="bodyContainer">
	<!-- 	<div class="mauntain1">
			<img alt="그림없음" width="1000" src="/resources/etc/snow_mauntain.png">
		</div>
		<div class="mauntain2">
			<img alt="그림없음" width="1000" src="/resources/etc/snow_mauntain.png">
		</div> -->

		<!-- 왼쪽 카테고리  -->
		<div class="mainCategory">
		
			<div class="category-body">
			
				<div class="category-title">
					<span class="category-span-main">
						<i class="bi bi-house-door-fill"></i> 메인으로
					</span>	
				</div>
				
				<div class="category-Box1">
					<div class="category cbox0">
						<span>개인정보</span>
					</div>
					
					<div class="category cbox1">
						<a href="#"> 
							<span class="category-span">
								<i class="bi bi-person-bounding-box"></i> 내 프로필
							</span> 
						</a>
					</div>
					<div class="category cbox2">
						<a href="#"> 
							<span class="category-span">
								<i class="bi bi-key-fill"></i> 비밀번호 변경
							</span> 
						</a>
					</div>
					<div class="category cbox3">
						<a href="#"> 
							<span class="category-span">
								<i class="bi bi-list-stars"></i> 결제내역
							</span> 
						</a>
					</div>
					<div class="category cbox4">
						<a href="#"> 
							<span class="category-span">
								<i class="bi bi-list-stars"></i> 환불신청
							</span> 
						</a>
					</div>
				</div>
				
				<div class="category-Box2">
					<div class="category cbox5">
						<span>회원 서비스</span>
					</div>
					
					<div class="category cbox6">
						<a href="/member/logoutSub"> 
							<span class="category-span">
								<i class="bi bi-box-arrow-left"></i> 로그아웃
							</span> 
						</a>
					</div>
					<div class="category cbox7">
						<a href="#"> 
							<span class="category-span">
								<i class="bi bi-person-fill-slash"></i> 회원탈퇴
							</span> 
						</a>
					</div>
				</div>
				
			</div>
		</div>
		
		<!-- 오른쪽 메인화면 -->
		<div class="mainView">
			<div class="mainViewBody1">
				<div class="mainViewBox1">
					<form action="/member/detail" method="post">
						<div class="modifyViewBox">
							<sec:authorize access="isAuthenticated()">
				        	<sec:authentication property="principal.mvo.memberId" var="authId"/>
				        	<sec:authentication property="principal.mvo.memberEmail" var="authEmail"/>
				        	<sec:authentication property="principal.mvo.memberAlias" var="authAlias"/>
				        	<sec:authentication property="principal.mvo.memberType" var="authType"/>
						
							<c:if test="${authType == 'normal' }">
							<div class="modifyBox modifyTitle">
								<span class="sb1-span">다이스키 정규회원입니다.</span>
							</div>
							<div class="modifyBox fbox1">
								<label for="sb1-input1" class="sb1-span" onclick="focusInput('sb1-input1')">아이디</label><br>
								<input class="sb1-input" id="sb1-input1" name="memberId" value="${mvo.memberId }" readonly="readonly">
								<input type="hidden" name="memberType" value=${mvo.memberType }>
							</div>
							<div class="modifyBox fbox2">
								<label for="sb1-input2" class="sb1-span" onclick="focusInput('sb1-input2')">이름</label><br>
								<input class="sb1-input" id="sb1-input2" value="${mvo.memberName }" readonly="readonly">
							</div>
							<div class="modifyBox fbox3">
								<label for="sb1-input3" class="sb1-span" onclick="focusInput('sb1-input3')">별명</label><br>
								<input class="sb1-input" path="memberAlias" id="sb1-input3" name="memberAlias" value="${mvo.memberAlias }">
							</div>
							<div class="modifyBox fbox4">
								<label for="sb1-input4" class="sb1-span" onclick="focusInput('sb1-input4')">이메일</label><br>
								<input class="sb1-input" id="sb1-input4" path="memberEmail" name="memberEmail" value="${mvo.memberEmail }" readonly="readonly" />
							</div>
							<div class="modifyBox fbox5">
								<label for="sb1-input5" class="sb1-span" onclick="focusInput('sb1-input2')">핸드폰번호</label><br>
								<input class="sb1-input" id="sb1-input5" path="memberPhoneNum" name="memberPhoneNum" value="${mvo.memberPhoneNum }">
							</div>
							<div class="modifyBox fbox6">
								<label for="inputMemberAddress" class="sb1-span" onclick="focusInput('sb1-input2')">주소</label><br>
								<input type="hidden" id="inputMemberPostcode">
								<input class="sb1-input" id="inputMemberAddress" name="memberAddress" onclick="clickAddr()" value="${mvo.memberAddress }">
								<button class="btn btn-primary" type="button"  id="button-addon2" onclick="sample6_execDaumPostcode()" style="display: none;" >주소 찾기</button>
							</div>
							<div class="modifyBox fbox7">
								<label for="inputMemberAddressDetail" class="sb1-span" onclick="focusInput('sb1-input3')">상세주소</label><br>
								<input class="sb1-input" id="inputMemberAddressDetail" name="memberAddressDetail" value="${mvo.memberAddressDetail}">
							</div>
							</c:if>
							<c:if test="${authType != 'normal' }">
							<div class="modifyTitle">
								<span class="sb1-span">다이스키 소셜(${mvo.memberType})회원입니다.</span>
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
								<input class="sb1-input" id="sb1-input3" name="memberAlias" value="${mvo.memberAlias }">
							</div>
							<div class="modifyBox fbox4">
								<label for="sb1-input4" class="sb1-span" onclick="focusInput('sb1-input2')">핸드폰번호</label><br>
								<input class="sb1-input" id="sb1-input4" name="memberPhoneNum" value="${mvo.memberPhoneNum }" placeholder="핸드폰번호를 입력해주세요."><br>
								<c:if test="${authType == 'google'}">
									<small style="color: red">구글 회원은 반드시 핸드폰번호를 기입해주세요.</small>
								</c:if>
							</div>
							<div class="modifyBox fbox5">
								<label for="inputMemberAddress" class="sb1-span" onclick="focusInput('sb1-input2')">주소</label><br>
								<input type="hidden" id="inputMemberPostcode">
								<input class="sb1-input" id="inputMemberAddress" name="memberAddress" onclick="clickAddr()" value="${mvo.memberAddress }" placeholder="주소를 입력해주세요.">
								<button class="btn btn-primary" type="button"  id="button-addon2" onclick="sample6_execDaumPostcode()" style="display: none;" >주소 찾기</button>
							</div>
							<div class="modifyBox fbox6">
								<label for="inputMemberAddressDetail" class="sb1-span" onclick="focusInput('sb1-input3')">상세주소</label><br>
								<input class="sb1-input" id="inputMemberAddressDetail" name="memberAddressDetail" value="${mvo.memberAddressDetail}" placeholder="상세주소를 입력해주세요.">
							</div>
							</c:if>
							</sec:authorize>
						</div>
						<div class="modify-btn">
							<button type="submit" class="btn btn-primary">수정하기</button> 
						</div>
					</form>
				</div>
				<div class="mainViewBox2">
					<div class="infoViewBox">
						<div class="li-title">
							<span>활동 정보</span>
						</div>
						<div class="infoBox ibox1">
							<div><span>가입일 </span>${mvo.memberRegAt }</div>
						</div>
						<div class="infoBox ibox2">
							<div><span>마지막 로그인 </span>${mvo.memberLastAt }</div>
						</div>
						<div class="infoBox ibox3">
							<div><span>비밀번호 변경일 </span>${mvo.memberPwdModAt }</div>
						</div>
						<div class="infoBox ibox4">
							<div class="form-check form-switch">
						        <input class="form-check-input" type="checkbox" 
						        	id="flexSwitchCheckDefault" ${mvo.memberTerms3 eq 'terms3check' ? 'checked' : ''} value="${mvo.memberId }">
						        <label class="form-check-label" for="flexSwitchCheckDefault">광고성/마케팅 동의(선택)</label>
						    </div>
						</div>
					</div>
				</div>
			</div>
			
				
			<div class="mainViewBody2">
				<div class="mainViewBox3">
					<a href="#"><span>문의내역</span></a>
					<div>
						<span>문의 내역 테스트</span>
					</div>	
			
				
					<a href="#"><span>내역조회</span></a>
					<div>
						<span>결제/환불 내역</span>
					</div>	
				</div>
			</div>
	

		
						
						
	</div>	
</div>

	
<jsp:include page="../common/footer.jsp"></jsp:include>
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