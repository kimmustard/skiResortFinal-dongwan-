<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 관리자 게시판</title>
<link  href="/resources/css/developer/setting.css" rel="stylesheet">
<link  href="/resources/css/developer/devNotice.css" rel="stylesheet">
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
		

		<div class="mmmmainContainer dev-container">
		<!-- 각자 페이지 개발구역 -->
		<div class="dev-notice-container">
			<div class="dev-notice-regbtn-container">
				<a href="/notice/register">
				<div class="d-grid gap-2 col-3 mx-auto dev-notice-regbtn-container2">
				  <button type="button" class="btn btn-primary">공지사항 등록하기</button>
				</div>
				</a>
			</div>
			
			<div class="accordion accordion-flush" id="accordionFlushExample">
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="true" aria-controls="flush-collapseOne">
			        게시물 목록 (총 N개)
			      </button>
			    </h2>
			    <div id="flush-collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body" style="background-color: rgb(208 208 208);">
			      	<table class="table table-hover">
					  <thead>
					    <tr>
					      <th scope="col">No.</th>
					      <th scope="col">게시물 분류</th>
					      <th scope="col">게시물 제목</th>
					      <th scope="col">작성자</th>
					      <th scope="col">작성일시</th>
					      <th scope="col">게시물 관리</th>
					    </tr>
					  </thead>
					  <tbody>
					    <tr>
					      <th scope="row">1</th>
					      <td>Mark</td>
					      <td>Otto</td>
					      <td>@mdo</td>
					      <td>@mdo</td>
					      <td>수정,삭제</td>
					    </tr>
					    <tr>
					      <th scope="row">2</th>
					      <td>Jacob</td>
					      <td>Thornton</td>
					      <td>@fat</td>
					      <td>@fat</td>
					      <td>@fat</td>
					    </tr>
					  </tbody>
					</table>
			      </div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
			        중요 게시물 목록(총 N개)
			      </button>
			    </h2>
			    <div id="flush-collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body" style="background-color: rgb(208 208 208);">
			      	<table class="table table-dark table-hover">
					  <thead>
					    <tr>
					      <th scope="col">No.</th>
					      <th scope="col">게시물 분류</th>
					      <th scope="col">게시물 제목</th>
					      <th scope="col">작성자</th>
					      <th scope="col">작성일시</th>
					      <th scope="col">게시물 관리</th>
					    </tr>
					  </thead>
					  <tbody>
					    <tr>
					      <th scope="row">1</th>
					      <td>Mark</td>
					      <td>Otto</td>
					      <td>@mdo</td>
					      <td>@mdo</td>
					      <td>수정,삭제,중요 게시글 고정 on off,상단 슬라이드 고정 on off</td>
					    </tr>
					    <tr>
					      <th scope="row">2</th>
					      <td>Jacob</td>
					      <td>Thornton</td>
					      <td>@fat</td>
					      <td>@fat</td>
					      <td></td>
					    </tr>
					  </tbody>
					</table>
			      </div>
			    </div>
			  </div>
			</div>
			

		</div>
	</div>	
	</div>
</div>
<script type="text/javascript" src="/resources/js/developer/setting.js"></script>
</body>
</html>