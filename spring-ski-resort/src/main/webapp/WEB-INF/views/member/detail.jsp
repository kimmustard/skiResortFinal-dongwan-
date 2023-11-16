<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
		<jsp:include page="../common/nav.jsp"></jsp:include>
	
		<div class="bodyContainer">
			<div class="registerContainer">
				
				<div class="registerBody">
					<form action="/member/register" method="post">
					
						
						<div class="registerMainBox">
						
							<div class="form-group registerBox rb-1">
	 							<label class="form-label mt-4" for="inputMemberId">아이디</label>
							    <div class="input-group mb-3">
							      <input type="text" class="form-control test55" id="inputMemberId" name="memberId" placeholder="아이디를 입력하세요" aria-label="Recipient's username" aria-describedby="button-addon2">
							      <button class="btn btn-primary" type="button">중복확인</button>
							    </div>
						    </div>
						    
							<div class="form-group registerBox rb-2">
						      <label for="exampleInputPassword1" class="form-label mt-4">Password</label>
						      <input type="password" class="form-control" name="memberPwd" id="exampleInputPassword1" placeholder="비밀번호" autocomplete="off">
						      <label for="exampleInputPassword2" class="form-label mt-4">Password check</label>
						      <input type="password" class="form-control" id="exampleInputPassword2" placeholder="비밀번호 확인" autocomplete="off">
						    </div>

							<div class="form-group registerBox rb-4">
	 							<label class="form-label mt-4" for="inputMemberAlias">닉네임</label>
							    <div class="input-group mb-3">
							      <input type="text" class="form-control" name="memberAlias" id="inputMemberAlias" placeholder="닉네임" aria-label="Recipient's username" aria-describedby="button-addon2">
							      <button class="btn btn-primary" type="button">중복확인</button>
							    </div>
						    </div>
						    
							<div class="form-group row registerBox rb-5">
							     <label for="exampleInputEmail1" class="form-label mt-4">Email</label>
							     <div>
							     <input type="email" class="form-control" name="memberEmail" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="이메일">
							     <small id="emailHelp" class="form-text text-muted">이메일 양식대로 입력해주세요.</small>
						   		 </div>
						    </div>
						    <!-- 주소 -->
						    <div class="form-group registerBox rb-6">
	 							<label class="form-label mt-4" for="inputMemberAddress">주소</label>
							    <div class="input-group mb-3">
							      <input type="text" class="form-control" name="memberAddress" id="inputMemberAddress" placeholder="주소를 입력해주세요." aria-label="Recipient's username" aria-describedby="button-addon2">
							      <button class="btn btn-primary" type="button" id="button-addon2">주소 찾기</button>
							    </div>
							    <div class="form-group registerBox rb-7">
									<input type="text" class="form-control" name="memberAddressDetail" placeholder="상세주소 입력...">
								</div>
						    </div>
						    
						    <div class="form-group registerBox rb-8">
								 <label class="col-form-label mt-4" for="inputMemberName">이름</label>
								 <input type="text" class="form-control" name="memberName" placeholder="실명 입력" id="inputMemberName">
							</div>   
						    
						    <div class="form-group registerBox rb-9">
								 <label class="col-form-label mt-4" for="inputMemberPhone">핸드폰 번호</label>
								 <input type="text" class="form-control" name="memberPhoneNum" placeholder="핸드폰 번호 입력" id="inputMemberPhone">
								 <small class="form-text text-muted">"-" 제외 후 핸드폰 번호 입력</small>
								 <small class="form-text text-muted">ex) 01012345678</small>
							</div>    
							
						</div>
						
						
						<!-- 체크박스 -->
						<div class="termsMainBox">
							
						 	<div class="form-check all-check">
						        <input class="form-check-input" type="checkbox" id="flexCheckDefault">
						        <label class="form-check-label" for="flexCheckDefault">
						          전체동의
						        </label>
						    </div>
						    <hr>
						    <div class="termsBox">
						    	<div class="tbBox tb-1">
							    	<input class="form-check-input" name="memberTerms1" type="checkbox" value="terms1check" id="flexCheckDefault-1">
							    	<input type="hidden" name="memberTerms1" id="terms1" value="non-check" >
							    	<label class="form-check-label" for="flexCheckDefault-1">
							          만 14세 이상입니다. (필수)
							        </label>
						        </div>
						        <div class="tbBox tb-2">
							        <input class="form-check-input" name="memberTerms2" type="checkbox" value="terms2check" id="flexCheckDefault-2">
							    	<input type="hidden" name="memberTerms2" id="terms2" value="non-check">
							    	<label class="form-check-label" for="flexCheckDefault-2">
							          이용약관 (필수)
							        </label>
							        <button type="button" class="btn btn-primary">약관보기</button>
						        </div>
						        <div class="tbBox tb-3">
							        <input class="form-check-input" name="memberTerms3" type="checkbox" value="terms3check" id="flexCheckDefault-3">
							    	<input type="hidden" name="memberTerms3" id="terms3" value="non-check">
							    	<label class="form-check-label" for="flexCheckDefault-3">
							          마케팅 동의 (선택)
							        </label>
						        </div>
						    
						    </div>
	
						</div>
					
						
						
						<div class="btnMainBox">
							<button type="submit" class="btn btn-primary bb-1">가입완료</button> 
							<a href="/"><button type="button" class="btn btn-primary bb-2">메인으로</button></a>
						</div>
					</form>
					
				</div>
			</div>	
			
		</div>
	
	<jsp:include page="../common/footer.jsp"></jsp:include>
	

</body>
</html>