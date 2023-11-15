<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	.bodyContainer{
		width: 100%;
		height: 1500px;
		position: relative;
	}
	.registerContainer{
		border: 1px solid black;
		width: 800px;
		position: absolute;
		top:40%;
		left: 50%;
	    transform: translate(-50%, -50%);
	}
	.registerBody{
		margin: 50px;
		display: flex;
		justify-content: center;
	}
	.registerMainBox{
		flex-direction:	column;
	}
	.registerBox{
		width: 300px;
	}

	.termsMainBox{
		margin-top: 50px;
	}
	
	.tbBox{
		margin-bottom: 10px;
	}
	
</style>
</head>
<body>

	<jsp:include page="../common/nav.jsp"></jsp:include>
	
		<div class="bodyContainer">
			<div class="registerContainer">
				
				<div class="registerBody">
					<form action="/member/register" method="post">
					
						
						<div class="registerMainBox">
						
							<div class="form-group registerBox rb-1">
	 							<label class="form-label mt-4">아이디</label>
							    <div class="input-group mb-3">
							      <input type="text" class="form-control test55" name="memberId" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="button-addon2">
							      <button class="btn btn-primary" type="button">중복확인</button>
							    </div>
						    </div>
						    
							<div class="form-group registerBox rb-2">
						      <label for="exampleInputPassword1" class="form-label mt-4">Password</label>
						      <input type="password" class="form-control" name="memberPwd" id="exampleInputPassword1" placeholder="Password" autocomplete="off">
						      <label for="exampleInputPassword1" class="form-label mt-4">Password check</label>
						      <input type="password" class="form-control" id="exampleInputPassword2" placeholder="Password check" autocomplete="off">
						    </div>

							<div class="form-group registerBox rb-4">
	 							<label class="form-label mt-4">닉네임</label>
							    <div class="input-group mb-3">
							      <input type="text" class="form-control" name="memberAlias" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="button-addon2">
							      <button class="btn btn-primary" type="button">중복확인</button>
							    </div>
						    </div>
						    
							<div class="form-group row registerBox rb-5">
							     <label for="exampleInputEmail1" class="form-label mt-4">Email</label>
							     <div>
							     <input type="email" class="form-control" name="memberEmail" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
							     <small id="emailHelp" class="form-text text-muted">이메일 양식대로 입력해주세요.</small>
						   		 </div>
						    </div>
						    <!-- 주소 -->
						    <div class="form-group registerBox rb-6">
	 							<label class="form-label mt-4">주소</label>
							    <div class="input-group mb-3">
							      <input type="text" class="form-control" name="memberAdderss" placeholder="주소를 입력해주세요." aria-label="Recipient's username" aria-describedby="button-addon2">
							      <button class="btn btn-primary" type="button" id="button-addon2">주소 찾기</button>
							    </div>
							    <div class="form-group registerBox rb-7">
									<input type="text" class="form-control" name="memberAdderss" placeholder="상세주소 입력...">
								</div>
						    </div>
						    
						    <div class="form-group registerBox rb-8">
								 <label class="col-form-label mt-4" for="inputDefault">핸드폰 번호</label>
								 <input type="text" class="form-control" name="memberPhoneNum" placeholder="Default input" id="inputDefault">
							</div>    
							
						</div>
						
						
						<!-- 체크박스 -->
						<div class="termsMainBox">
							
						 	<div class="form-check all-check">
						        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
						        <label class="form-check-label" for="flexCheckDefault">
						          전체동의
						        </label>
						    </div>
						    <hr>
						    <div class="termsBox">
						    	<div class="tbBox tb-1">
							    	<input type="checkbox" value="" id="flexCheckDefault-1">
							    	<label class="form-check-label" for="flexCheckDefault-1">
							          만 14세 이상입니다. (필수)
							        </label>
						        </div>
						        <div class="tbBox tb-2">
							        <input type="checkbox" value="" id="flexCheckDefault-2">
							    	<label class="form-check-label" for="flexCheckDefault-2">
							          이용약관 (필수)
							        </label>
							        <button type="button">약관보기</button>
						        </div>
						        <div class="tbBox tb-3">
							        <input type="checkbox" value="" id="flexCheckDefault-3">
							    	<label class="form-check-label" for="flexCheckDefault-3">
							          마케팅 동의 (선택)
							        </label>
						        </div>
						    
						    </div>
	
						</div>
					
						
						
						
						<button type="submit">가입완료</button> 
						<a href="/"><button type="button">메인으로</button></a>
					</form>
					
				</div>
			</div>	
			
		</div>
	
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<script type="text/javascript" src="/resources/js/member/MemberRegister.js"></script>
	
</body>
</html>