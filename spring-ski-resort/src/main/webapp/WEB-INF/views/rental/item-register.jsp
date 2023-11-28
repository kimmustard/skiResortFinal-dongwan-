<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장비 파일 등록 페이지</title>
<style type="text/css">
.bodyContainer{
	margin-top: 100px;
}

.formContainer{
	width: 900px;
	height: 500px;
	background-color: silver;
	position: relative;
	left: 50%;
	transform: translateX(-50%);
	position: absolute;
}

.inputContainer{
	margin-top: 15px;
}

.inputContainer > p,input{
	margin: 15px;
}
</style>
</head>
<body>
	<jsp:include page="../common/nav.jsp" />
	
	<div class="bodyContainer">
	
	
	
		<div class="formContainer">
			<form action="/rental/item-register" method="post">
				<div class="inputContainer">
					<p class="fs-4">장비종류 선택</p>
					<input class="form-check-input" type="radio" name="rentalListItemType" value="일반장비SET" id="lowItem">일반장비SET
					<input class="form-check-input" type="radio" name="rentalListItemType" value="중급장비SET" id="midItem">중급장비SET
					<input class="form-check-input" type="radio" name="rentalListItemType" value="프리미엄장비SET" id="premiumItem">프리미엄장비SET
					<p class="fs-4">장비명</p>
					<input class="form-control" type="text">
					<p class="fs-4">요금</p>
					<input class="form-control" type="text">
				</div>
				
				
				
				<div class="btnContainer">
					<div>
				  		<input type="file" name="files" id="files" style="display: none;" multiple="multiple">
				  		<button type="button" id="trigger" class="btn btn-outline-primary">파일선택</button>
					</div>
					
					<div>
						<button type="submit" class="btn btn-outline-primary">등록</button>
					</div>
				</div>
			</form>
		</div>
	
	
	
	</div>
	
	
	<script type="text/javascript" src="/resources/js/rental/rentalRegister.js"></script>
	
</body>
</html>