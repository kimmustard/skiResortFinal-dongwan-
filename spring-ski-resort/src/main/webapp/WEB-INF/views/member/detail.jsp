<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<div class="mauntain1">
			<img alt="그림없음" height="1000px" src="/resources/etc/snow_mauntain.png">
		</div>
		<div class="mauntain2">
			<img alt="그림없음" height="1000px" src="/resources/etc/snow_mauntain.png">
		</div>
		<div class="detailContainer">
		
				
				<div class="detailMainBody1">
					<div class="category-title">
						<a href="#">
							<span class="category-span-main">
								<i class="bi bi-house-door-fill"></i> 메인으로
							</span>	
						</a>
					</div>
					<ul class="MainBody1-category">
					
					
						<li><span class="category-span-main">개인정보</span></li>
						<li>
							<a href="#"> 
								<span class="category-span">
									<i class="bi bi-person-bounding-box"></i> 내 프로필
								</span> 
							</a>
						</li>
						<li>
							<a href="#"> 
								<span class="category-span">
									<i class="bi bi-key-fill"></i> 비밀번호 변경
								</span> 
							</a>
						</li>
						<li>
							<a href="#"> 
								<span class="category-span">
									<i class="bi bi-list-stars"></i> 결제내역
								</span> 
							</a>
						</li>
						<li>
							<a href="#"> 
								<span class="category-span">
									<i class="bi bi-list-stars"></i> 환불신청
								</span> 
							</a>
						</li>
					</ul>
					<ul class="MainBody2-category">
						<li class="category-span-main">회원 서비스</li>
						
						<li>
							<a href="#"> 
								<span class="category-span">
									<i class="bi bi-box-arrow-left"></i> 로그아웃
								</span> 
							</a>
						</li>
						<li>
							<a href="#"> 
								<span class="category-span">
									<i class="bi bi-person-fill-slash"></i> 회원탈퇴
								</span> 
							</a>
						</li>
					</ul>
				</div>
				
				<div class="detailMainBody2_3">
				
					<div class="detailMainBody2">
						<div class="detailSubBox1">
								<ul>
									<li>
										<span class="sb1-span">다이스키 정규회원입니다.</span>
									</li>
									<li>
										<label for="sb1-input1" class="sb1-span" onclick="focusInput('sb1-input1')">아이디</label><br>
										<input class="sb1-input" id="sb1-input1" value="${mvo.memberId }">
									</li>
									<li>
										<label for="sb1-input2" class="sb1-span" onclick="focusInput('sb1-input2')">이름</label><br>
										<input class="sb1-input" id="sb1-input2" value="${mvo.memberName }">
									</li>
									<li>
										<label for="sb1-input3" class="sb1-span" onclick="focusInput('sb1-input3')">별명</label><br>
										<input class="sb1-input" id="sb1-input3" value="${mvo.memberAlias }">
									</li>
									<li>
										<label for="sb1-input4" class="sb1-span" onclick="focusInput('sb1-input4')">이메일</label><br>
										<input class="sb1-input" id="sb1-input4" value="${mvo.memberEmail }">
									</li>
	
								</ul>
								<div class="modify-btn">
									<button type="submit" class="btn btn-primary">수정하기</button> 
								</div>
						</div>
						<div class="detailSubBox2">
							<ul>
								<li><span>활동 정보</span></li>
								<li>
									<span>가입일</span><br>
									<div></div>
								</li>
								<li>
									<span>로그인</span><br>
									<div></div>
								</li>
								<li>
									<span>최종 로그인 IP</span><br>
									<div></div>
								</li>
								<li>
									<span>문의 내역</span><br>
									<div></div>
								</li>
								<li>
									<span>환불 내역</span><br>
									<div></div>
								</li>
							</ul>
						</div>
					</div>
					
					<div class="detailMainBody3">
						<div class="detailSubBox3">
							<a href="#"><span>내역 상세조회</span></a>
							<div>
								<span>결제/환불 내역</span>
							</div>	
						</div>
					</div>
					
				</div>
	</div>	
</div>	<!-- modify body -->
	


<jsp:include page="../common/footer.jsp"></jsp:include>
<script>
	function focusInput(inputId) {
	    // 라벨 클릭시 인풋창 뒤로 focus하게하는 스크립트
	    var inputElement = document.getElementById(inputId);
	    inputElement.focus();
	    inputElement.setSelectionRange(inputElement.value.length, inputElement.value.length);
	}
</script>

</body>
</html>