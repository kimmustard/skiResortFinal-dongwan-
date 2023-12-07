<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link  href="/resources/css/developer/setting.css" rel="stylesheet">
<link  href="/resources/css/developer/devCoupon.css" rel="stylesheet">
</head>
<body>
	<div class="devMainContainer">
		<div class="devNav">
			<div class="marquee marquee1">
				  <p class="marquee-text"><img alt="" height="50" src="/resources/etc/line.png"></p>
				</div>
			
		</div>
		
		<div class="devBody">
			
			<jsp:include page="../common/devCategory.jsp"></jsp:include>
			

			<div class="mmmmainContainer">
			<!-- 각자 페이지 개발구역 -->
				<div class="couponContainer">
					<div class="couponListTitle">
						<h3>라이브서버 쿠폰 목록</h3>
					</div>
					<div class="couponList">
						<table class="table table-hover">
						<thead>
							<tr class="table-dark">
								<th>코드</th>
								<th>쿠폰이름</th>
								<th>사용가능</th>
								<th>검색여부</th>
								<th>중복여부</th>
								<th>쿠폰기간</th>
								<th>할인금액(int)</th>
								<th>할인율(rate)</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${csList}" var="cs">
									<tr>
										<th>${cs.couponCode }</th>
										<th>${cs.couponName }</th>
										<th>${cs.couponAdminCheck }</th>
										<th>${cs.couponSearch }</th>
										<th>${cs.couponDupli }</th>
										<th>${cs.couponDay }</th>
										<th>${cs.couponInt }</th>
										<th>${cs.couponRate }</th>
									</tr>
								</c:forEach>
							</tbody>
						</table>			
					</div>
				<div class="settingAndOrder">
					<div class="couponSetting">
						<h3>쿠폰 생성하기</h3>
						<hr>
						<form action="/developer/createCoupon" method="post">
							<div class="form-group">
							  <label class="col-form-label mt-4" for="inputDefault1">쿠폰코드 (중복불가)</label>
							  <input type="text" class="form-control coupon-input" name="couponCode" placeholder="생성할 쿠폰코드 입력" id="inputDefault1">
							</div>
							<div class="form-group">
							  <label class="col-form-label mt-4" for="inputDefault2">쿠폰이름 (중복불가)</label>
							  <input type="text" class="form-control coupon-input" name="couponName" placeholder="생성할 쿠폰이름 입력" id="inputDefault2">
							</div>
							<hr>
							<p>쿠폰 옵션</p>
							<div class="form-group coupone-setting-check">
							      <div class="form-check">
							        <input class="form-check-input" type="checkbox" value="Y"  name="couponAdminCheck" id="flexCheckDefault3" checked="">
							        <input class="form-check-input" type="hidden" value="N"  name="couponAdminCheck" id="flexCheckDefault3_hidden" disabled="">
							        <label class="form-check-label" for="flexCheckChecked3">
							          사용가능여부
							        </label>
							      </div>
							      <div class="form-check">
							        <input class="form-check-input" type="checkbox" value="Y" name="couponSearch" id="flexCheckDefault4">
							        <input class="form-check-input" type="hidden" value="N" name="couponSearch" id="flexCheckDefault4_hidden" checked="">
							        <label class="form-check-label" for="flexCheckDefault4">
							          검색여부
							        </label>
							      </div>
							      <div class="form-check">
							        <input class="form-check-input" type="checkbox" value="Y"  name="couponDupli" id="flexCheckDefault5">
							        <input class="form-check-input" type="hidden" value="N"  name="couponDupli" id="flexCheckDefault5_hidden" checked="">
							        <label class="form-check-label" for="flexCheckDefault5">
							          중복여부
							        </label>
							      </div>
					      </div>
					      <hr>
					       <div class="form-group">
						      <label for="exampleSelect1" class="form-label mt-4">쿠폰기간 설정 (일)</label>
						      <select class="form-select" id="exampleSelect1"  name="couponDay">
						        <option selected value="">기간 선택</option>
						        <option value="7">7일</option>
						        <option value="30">30일</option>
						        <option value="60">60일</option>
						        <option value="90">90일</option>
						        <option value="365">365일</option>
						  	 </select>
	    					</div>
	    					
	    				  <div class="form-group">
						      <label for="exampleSelect2" class="form-label mt-4">할인금액 선택</label>
						      <select class="form-select" id="exampleSelect2" name="defaultAmount">
						      	<option selected value="">금액 선택</option>
						        <option value="1000">1000원</option>
						        <option value="3000">3000원</option>
						        <option value="5000">5000원</option>
						        <option value="10000">10000원</option>
						        <option value="3">3%</option>
						        <option value="5">5%</option>
						        <option value="7">7%</option>
						        <option value="10">10%</option>
						  	 </select>
	    					</div>
	    				<div class="form-group coupon-btn">	
	    					<button type="submit" class="btn btn-success coupon-create-btn">쿠폰 생성</button>
	    				</div>
	    				
						</form>
					</div>

					<div class="couponOrder">
						<h3>쿠폰 삭제하기</h3>
						<form action="">
							<div class="input-group mb-3 delete-coupon">
							      <input type="text" class="form-control" id="deleteCouponInput1" name="couponCode" placeholder="삭제할 쿠폰코드 입력" aria-label="Recipient's username" aria-describedby="button-addon2">
							      <button class="btn btn-primary" type="submit" id="button-addon2">삭제</button>
						    </div>
					    </form>
					    <hr>
					    <h3>쿠폰 지급하기</h3>
					    <div class="form-group">
						  <label class="col-form-label mt-4" for="inputDefault6">회원 아이디</label>
						  <input type="text" class="form-control" placeholder="Default input" id="inputDefault6">
						</div>
					    <div class="form-group">
						  <label class="col-form-label mt-4" for="inputDefault7">지급할 쿠폰코드</label>
						  <input type="text" class="form-control" placeholder="Default input" id="inputDefault7">
						</div>
						<button class="btn btn-success" type="submit" id="button-addon2">쿠폰 전송</button>
						<hr>
						<h3>모든 유저에게 쿠폰지급</h3>
						
					</div>
				</div>
			</div>
			
			
		</div>
	</div>
	
	
	
	</div>
	<script type="text/javascript">
		const isOk = `<c:out value="${isOk}" />`;
		if(isOk == 1){
			alert('쿠폰 발급완료');
		}else if(isOk == 2){
			alert('이미 존재하는 이름(코드) 입니다.')
		}else if(isOk ==3){
			alert('공백X.')
		}
	</script>
	<script type="text/javascript" src="/resources/js/developer/setting.js"></script>
	<script type="text/javascript" src="/resources/js/developer/settingCoupon.js"></script>
</body>
</html>