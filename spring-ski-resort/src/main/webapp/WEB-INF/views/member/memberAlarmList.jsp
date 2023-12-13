<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
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
	<div class="backgroundImgAlarm">
	
	</div>
	<!-- 왼쪽 카테고리  -->
	<div class="mainCategory">
	<jsp:include page="../common/member_category.jsp"></jsp:include>
	</div>
	<!-- 오른쪽 메인화면 -->
		<div class="alarmViewContainer">
		
			<div class="alarmViewBox">
				<div class="alarmTitle">
					<span><i class="bi bi-bell"></i> 서비스알림 메세지함 </span>
					
					<div class="alarmCheckBox">
						<div class="form-check form-switch">
						 <input class="form-check-input" type="checkbox" 
				        	id="alarmSwitchCheckDefault" ${mvo.member_alarm_system eq 'Y' ? 'checked' : ''} value="${mvo.memberId }">
				        <label class="form-check-label" for="alarmSwitchCheckDefault">알람 ON/OFF</label>
				        </div>
					</div>
					
				</div>

				
					<table class="table table-hover">
					  <thead>
					    <tr class="table-info">
					      <th style="width: 80px;" scope="col">보낸사람</th>
					      <th style="width: 50px;" scope="col">분류</th>
					      <th scope="col">메세지 내용 (클릭시 이동)</th>
					      <th style="width: 50px;" scope="col">읽음</th>
					      <th scope="col">시간</th>
					      <th scope="col"></th>
					    </tr>
					  </thead>
					  <tbody>
				<c:forEach items="${alarmList }" var="aList">
					
					    <tr class="table-default">
					      <th scope="row">${aList.alarmContentName }</th>
					      <td><a href="${aList.alarmContentUrl}" data-alarmregat="${aList.alarmRegAt}" data-membernum="${aList.memberNum}">${aList.alarmType}</a></td>
					      <td><a href="${aList.alarmContentUrl}" data-alarmregat="${aList.alarmRegAt}" data-membernum="${aList.memberNum}">${aList.alarmContentText}</a></td>
					      <td>${aList.alarmCheck }</td>
					      <td>${aList.alarmRegAt }</td>
					      <td> <a href="/alarm/alarmRemove?alarmRegAt=${aList.alarmRegAt}"><button>X</button></a> </td>
					    </tr>
				</c:forEach>
					  </tbody>
					 </table>
				
			</div>
		</div>
	</div>
	
	
	
	<div id="modalEmailCheckBtn"></div>
	<div id="inputMemberEmail"></div>
	
	<script type="text/javascript" src="/resources/js/member/MemberAlarm.js"></script>
	
</body>
</html>