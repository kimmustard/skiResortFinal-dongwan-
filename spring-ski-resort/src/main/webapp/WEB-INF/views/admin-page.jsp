<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link  href="/resources/css/member/modify.css" rel="stylesheet">
</head>
<body>
	
<jsp:include page="common/nav.jsp"></jsp:include>

	<div class="bodyContainer">
		<div class="modifyContainer">
		
				
				<div class="modifyMainBody1">
					<div class="accordion accordion" id="accordionPanelsStayOpenExample">
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="panelsStayOpen-headingOne">
					      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="false" aria-controls="panelsStayOpen-collapseOne">
					        내 프로필
					      </button>
					    </h2>
					    <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
					      <div class="accordion-body">
					      	<ul class="MainBody1-category">
					      		<li><a href="#">회원 프로필 변경</a></li>
					      		<li><a href="#">비밀번호 변경</a></li>
					      	</ul>	        
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
					        결제 정보
					      </button>
					    </h2>
					    <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
					      <div class="accordion-body">
					      	<ul class="MainBody1-category">
					      		<li><a href="#">결제 내역 조회</a></li>
					      		<li><a href="#">환불 신청</a></li>
					      	</ul>	
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="panelsStayOpen-headingThree">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
					        회원 기능
					      </button>
					    </h2>
					    <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree">
					      <div class="accordion-body">
					      	<ul class="MainBody1-category">
					      		<li><a href="#">로그아웃</a></li>
					      		<li><a href="#">회원탈퇴</a></li>
					      	</ul>	
					      </div>
					    </div>
					  </div>
					</div>
				
				
				
					<ul class="MainBody1-category">
						<li>카테고리</li>
						<li><a href="#">내 프로필</a></li>
						<li><a href="#">비밀번호 변경</a></li>
						<li><a href="#">결제이력</a></li>
						<li><a href="#">환불신청</a></li>
						<li><a href="#">로그아웃</a></li>
						<li><a href="#">회원탈퇴</a></li>
					</ul>
				</div>
				
				<div class="modifyMainBody2_3">
				
					<div class="modifyMainBody2">
						<div class="modifySubBox1">
							<a href="#"><span>상세정보 수정하기</span></a>
							<div>
								<span>다이스키 일반회원입니다.</span><br>
								아이디
							</div>
							<div>
								별명
							</div>
							<div>
								이름
							</div>	
							<div>
								이메일 
							</div>
							<div>
								회원 인증상태
							</div>
						</div>
						<div class="modifySubBox2">
							<span>활동 정보</span>
						</div>
					</div>
					
					<div class="modifyMainBody3">
						<div class="modifySubBox3">
							<a href="#"><span>내역 상세조회</span></a>
							<div>
								<span>결제/환불 내역</span>
							</div>	
						</div>
					</div>
					
				</div>
			

	</div>
		
			<div class="btnMainBox">
				<div>
					<span>아이디</span>
					<input>
				</div>
				<div>
					<span>이름</span>
					<input>
				</div>
				<div>
					<span>닉네임</span>
					<input>
				</div>
				<div>
					<span>이메일</span>
					<input>
				</div>
				<div>
					<span>핸드폰번호</span>
					<input>
				</div>
				<div>
					<span>주소</span>
					<input>
				</div>
				<div>
					<span>상세주소</span>
					<input>
				</div>
				
				<button type="submit" class="btn btn-primary">가입완료</button> 
				<a href="/"><button type="button" class="btn btn-primary">이전페이지</button></a>
			</div>
</div>	<!-- modify body -->
	


<jsp:include page="common/footer.jsp"></jsp:include>
	

</body>
</html>