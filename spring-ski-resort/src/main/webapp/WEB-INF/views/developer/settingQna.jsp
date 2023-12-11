<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객문의 관리자 게시판</title>
<link  href="/resources/css/developer/setting.css" rel="stylesheet">
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
				<div>
					답변 미등록 문의 글
				</div>
				<table>
					<tr>
						<c:forEach items="${list }" var="qvo">
							<c:if test="${qvo.qnaIsok == 'N' }">
								<th>
										답변미등록 게시글 : No.${qvo.qnaNum }
								</th>
								<td>
									<a href="/qna/detail?qnaNum=${qvo.qnaNum }">${qvo.qnaTitle }</a>						
								</td>
							</c:if>	 
						</c:forEach>
					</tr>
				</table>

			</div>
		</div>
	</div>
	<script type="text/javascript" src="/resources/js/developer/setting.js"></script>
</body>
</html>