<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장비 파일 등록 페이지</title>
<link rel="stylesheet" href="/resources/css/rental/item_register.css">
</head>
<body>
	<jsp:include page="../common/nav.jsp" />
	
	<div class="bodyContainer">
	
	
	
		<div class="formContainer">
			<form action="/rental/item-register" method="post" enctype="multipart/form-data">
				<div class="inputContainer">
					<div class="itemType">
						<p class="fs-4">장비타입 선택</p>
						<input class="form-check-input" type="radio" name="rentalListItemType" value="스키" id="skiItem">스키
						<input class="form-check-input" type="radio" name="rentalListItemType" value="보드" id="boardItem">보드
						<input class="form-check-input" type="radio" name="rentalListItemType" value="의류" id="wearItem">의류
					</div>
					<div class="itemType">
						<p class="fs-4">장비등급 선택</p>
						<input class="form-check-input" type="radio" name="rentalListItemGrade" value="일반장비" id="lowItem">일반장비
						<input class="form-check-input" type="radio" name="rentalListItemGrade" value="중급장비" id="midItem">중급장비
						<input class="form-check-input" type="radio" name="rentalListItemGrade" value="프리미엄장비" id="premiumItem">프리미엄장비
					</div>
					<div class="itemInfo">
						<div class="input-group" id="rowItemName" style="display: none;">
							<span class="input-group-text">일반장비명</span>
							<input class="form-control" type="text" name="rentalListLowItem" id="rentalListRowItem">
						</div> 
						<div class="input-group" id="midItemName" style="display: none;">
							<span class="input-group-text">중급장비명</span>
							<input class="form-control" type="text" name="rentalListMidItem" id="rentalListMidItem">
						</div>
						<div class="input-group" id="premiumItemName" style="display: none;">
							<span class="input-group-text">프리미엄장비명</span>
							<input class="form-control" type="text" name="rentalListPremiumItem" id="rentalListPremiumItem">
						</div>
						<div class="input-group" id="itemCount" style="display: none;">
							<span class="input-group-text">수량</span>
							<input class="form-control" type="text" name="rentalListItemCount" id="rentalListItemCount" value="0">
						</div>
						
					</div>
				</div>
				
				
				
				<div class="mb-3">
					<div>
				  		<input type="file" name="files" id="files" style="display: none;" multiple="multiple">
				  		<button type="button" id="trigger" class="btn btn-outline-primary">파일선택</button>
					</div>
					
					<div class="mb-3" id="fileZone">
						<!-- 파일표시 -->
					</div>
				</div>
				<button type="submit" class="btn btn-outline-primary" id="regBtn">등록</button>
			</form>
		</div>
	
	
	
	</div>
	
	
	<script type="text/javascript" src="/resources/js/rental/rentalRegister.js"></script>
	<script type="text/javascript" src="/resources/js/rental/itemRegister.js"></script>
	
</body>
</html>
