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
					
					<div class="couponList">
						<h3>라이브서버 쿠폰 목록</h3>
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
					<div class="couponSetting">
						쿠폰 설정
					</div>
					
				</div>
			
			</div>
			
			
		</div>

	
	
	
	</div>
	<script type="text/javascript" src="/resources/js/developer/setting.js"></script>
</body>
</html>