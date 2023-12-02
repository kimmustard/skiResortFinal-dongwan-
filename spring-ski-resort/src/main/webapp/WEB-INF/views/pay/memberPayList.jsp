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
			<div class="category-profile">
				<img alt="그림없음" width="230" height="200" src="/resources/etc/logo_white.png">
				<span>회원님의 등급은 <span id="member-grade">${mvo.memberGrade} </span> 입니다.</span>
			</div>
		
			<div class="category-body">
				<div class="category-Box1">
					<div class="category cbox1">
						<a href="/member/detail"> 
							<i class="bi bi-person-bounding-box"></i>
							<span class="category-span cs1">
								 내 프로필
							</span> 
						</a>
					</div>
					<div class="category cbox2">
						<a href="#"> 
								<i class="bi bi-key-fill"></i>
							<span class="category-span cs2">
							 	비밀번호 변경
							</span> 
						</a>
					</div>
					<div class="category cbox3">
						<a href="#"> 
								<i class="bi bi-list-stars"></i>
							<span class="category-span">
								 결제내역
							</span> 
						</a>
					</div>
					<div class="category cbox4">
						<a href="#"> 
								<i class="bi bi-list-stars"></i>
							<span class="category-span">
								 문의내역
							</span> 
						</a>
					</div>
					<div class="category cbox6">
						<a href="/member/logoutSub"> 
								<i class="bi bi-box-arrow-left"></i> 
							<span class="category-span">
								로그아웃
							</span> 
						</a>
					</div>
					<div class="category cbox7">
						<a href="#"> 
								<i class="bi bi-person-fill-slash"></i>
							<span class="category-span">
								 회원탈퇴
							</span> 
						</a>
					</div>
				</div>
				
				<div class="category-Box2">
					<div class="category cbox8">
						<div class="form-check form-switch">
					        <input class="form-check-input" type="checkbox" 
					        	id="flexSwitchCheckDefault" ${mvo.memberTerms3 eq 'terms3check' ? 'checked' : ''} value="${mvo.memberId }">
					        <label class="form-check-label" for="flexSwitchCheckDefault">광고성/마케팅 동의(선택)</label>
					    </div>
					</div>
					<div class="category cbox9">
						<div><span>가입일 </span>${mvo.memberRegAt }</div>
					</div>
					<div class="category cbox10">
						<div><span>마지막 로그인 </span>${mvo.memberLastAt }</div>
					</div>
					<div class="category cbox11">
						<div><span>비밀번호 변경일 </span>${mvo.memberPwdModAt }</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 오른쪽 메인화면 -->
		<div class="mainView">
			<div class="mainViewBody1">
				<div class="mainViewBox1">
					
			</div>
			
				
			<%-- <div class="mainViewBody2">
				<div class="mainViewBox3">
					<div class="infoBox ibox5">
						<div class="iboxList iboxList1">
							<div>
								<span id="iboxTitle">문의 내역 테스트</span>
							</div>
							<a href="#"><span>문의내역</span></a>
						</div>
					</div>	
			
				
					<div class="infoBox ibox6">
						<div class="iboxList iboxList2">
							<div>
								<span>결제/환불 내역</span>
							</div>
							<a href="#"><span>상세조회</span></a>
						</div>
						<table class="table table-hover">
									<thead>
										<tr>
											<th>주문번호</th>
											<th>결제은행</th>
											<th>주문명</th>
											<th>금액</th>
											<th>이름</th>
											<th>상태</th>
											<th>결제일자</th>
										</tr>
							
							
									</thead>
									<tbody>
										<c:forEach items="${pivoList}" var="pList">
											<tr>
												<td>${pList.payMerchantUid }</td>
												<td>${pList.payPg }</td>
												<td>${pList.payName }</td>
												<td>${pList.payAmount } 원</td>
												<td>${pList.memberName }</td>
												<td>${pList.payStatus }</td>
												<td>${pList.payRegAt }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
											 
								
					</div>	
				</div>
			</div> --%>
			
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