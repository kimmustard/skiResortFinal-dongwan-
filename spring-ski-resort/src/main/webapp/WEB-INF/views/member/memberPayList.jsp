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
	<div class="backgroundImgList">
	
	</div>
	<!-- 왼쪽 카테고리  -->
	<div class="mainCategory">
	<jsp:include page="../common/member_category.jsp"></jsp:include>
	</div>
	<!-- 오른쪽 메인화면 -->
	<div class="mainView">
		<div class="mainViewBody2">
			<div class="mainViewBox3">
				<div class="infoBox ibox6">
					<div class="iboxList iboxList2">
						<span>결제/환불 내역</span>
						<span>총 결제 금액 : ${sum} 원 </span>
					</div>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>주문번호</th>
								<th>결제은행</th>
								<th>주문명</th>
								<th>금액</th>
								<th>이름</th>
								<th>연락처</th>
								<th>상태</th>
								<th>결제일자</th>
								<th>요청</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${pivoList}" var="pList">
								<tr>
									<td>
										${pList.payMerchantUid }
										<input type="hidden" value="${pList.payImpUid }">
									</td>
									<td>${pList.payPg }</td>
									<td>${pList.payName }</td>
									<td>${pList.payAmount } 원</td>
									<td>${pList.memberName }</td>
									<td>${pList.memberPhoneNum }</td>
									<td>${pList.payStatus }</td>
									<td>${pList.payRegAt }</td>
									<td style="display:none">${pList.payNameType}</td>
									<c:choose>
									<c:when test="${pList.payStatus eq '결제완료' }">
										<td>
											<button type="button" class="refunds"  onclick="showRowData(this)" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
											  환불요청
											</button>
										</td>
									</c:when>
									<c:otherwise>
										<td>
											<button>환불영수증</button>
										</td>
									</c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>
						</tbody>
					</table>			
					</div>	
				</div>
			</div>
				
		</div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="staticBackdropLabel">환불 요청</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" id="refund-close" aria-label="Close"></button>
	      </div>
	      <div class="modal-body refundInfo-body">
	       	<div class="transactionInfo" id="transactionInfo">
	       		
	       	</div>
	       	<hr>
	       	<div class="refundInfo" id="refundInfo">
	       		 
	       	</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" id="refundInfoBtn">환불 요청하기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<div id="modalEmailCheckBtn"></div>
	<div id="inputMemberEmail"></div>
	
	<script type="text/javascript" src="/resources/js/member/MemberDetail.js"></script>
	<script type="text/javascript" src="/resources/js/pay/MemberRefund.js"></script>
	
</body>
</html>