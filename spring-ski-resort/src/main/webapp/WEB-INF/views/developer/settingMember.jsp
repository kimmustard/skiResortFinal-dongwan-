<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link  href="/resources/css/developer/setting.css" rel="stylesheet">
<link  href="/resources/css/developer/devMember.css" rel="stylesheet">
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
				<div class="memberListContainer">
					<table class="table table-hover">
						<thead>
							<tr class="table-dark">
							
								<th>번호</th>
								<th>id</th>
								<th>종류</th>
								<th>별명</th>
								<th>이름</th>
								<th>이메일</th>
								<th>주소</th>
								<th>상세주소</th>
								<th>핸드폰</th>
								<th>가입일</th>
								<th>등급</th>
								<th>약관여부1/2/3</th>
								<th>탈퇴여부</th>
								<th>보안등급</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${mvoList}" var="mList">
								<tr class="memberTr">
									<th>${mList.memberNum }</th>
									<th>${mList.memberId }</th>
									<th>${mList.memberType }</th>
									<th>${mList.memberAlias }</th>
									<th>${mList.memberName }</th>
									<th>${mList.memberEmail }</th>
									<th>${mList.memberAddress }</th>
									<th>${mList.memberAddressDetail }</th>
									<th>${mList.memberPhoneNum }</th>
									<th>${mList.memberRegAt }</th>
									<th>${mList.memberGrade }</th>
									<th>${mList.memberTerms1 }/${mList.memberTerms2 }/${mList.memberTerms3 }</th>
									<th>${mList.memberDel }</th>
									<th>
										<c:forEach items="${mList.authList}" var="authList">		
											${authList.auth }
										</c:forEach>
										<button class="btn btn-danger role_up" id="role_up">↑</button>
										<button class="btn btn-success role_down" id="role_down">↓</button>
									</th>
								</tr>
							</c:forEach>
						</tbody>
					</table>			
						
				</div>
			</div>
			
		</div>

	</div>
	<script type="text/javascript" src="/resources/js/developer/setting.js"></script>
</body>
</html>