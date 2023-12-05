<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/notice/notice_list.css">

  <!-- summernote -->
  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
  
  <!-- 서머노트를 위해 추가해야할 부분 -->
  <script src="/resources/js/summernote/summernote-lite.js"></script>
  <script src="/resources/js/summernote/lang/summernote-ko-KR.js"></script>
  <link rel="stylesheet" href="/resources/css/summernote/summernote-lite.css">

</head>
<body>
<jsp:include page="../common/nav.jsp" />      	
<div class="notice-img-container" style="background-image: url('https://a.cdn-hotels.com/gdcs/production68/d766/4cc034a7-aeb1-4edd-b2a9-f7feaac49aec.jpg')">	</div>
<br><br><br><br><br><br><br>
<div class="container">   	

	<form action="/notice/register" method="post" enctype="multipart/form-data">
		
		<div class="mb-3">
		  <label for="exampleFormControlInput1" class="form-label">제목</label>
		  <input type="text" class="form-control" name="noticeTitle" id="exampleFormControlInput1" placeholder="제목입력">
		</div>
		
		<div class="mb-3">
		  <label for="exampleFormControlInput1" class="form-label">카테고리</label>
		  <select class="form-select" name="noticeCategory" id="inputGroupSelect01">
		  	<option value="공지사항">공지사항</option>
		  	<option value="이벤트">이벤트</option>
		  	<option value="보도자료">보도자료</option>
		  	<option value="쇼핑몰">쇼핑몰</option>
		  	<option value="채용정보">채용정보</option>
		  	<option value="기타">기타</option>
		  </select>
		</div>
		
		<div class="mb-3">
		  <label for="exampleFormControlInput1" class="form-label">작성자</label>
		  <sec:authorize access="isAuthenticated()"> <!-- 로그인 -->
			<sec:authentication property="principal.mvo.memberId" var="authId"/>
			<sec:authentication property="principal.mvo.memberEmail" var="authEmail"/>
			<sec:authentication property="principal.mvo.memberAlias" var="authAlias"/>
			<sec:authentication property="principal.mvo.memberType" var="authType"/>
			  <c:if test="${authType == 'normal' }">
			  	<input type="text" class="form-control" name="noticeWriter" id="exampleFormControlInput1" value="${authId }" readonly="readonly">
			  </c:if>
			  <c:if test="${authType != 'normal' }">
			  	<input type="text" class="form-control" name="noticeWriter" id="exampleFormControlInput1" value="${authEmail }" readonly="readonly">
			  </c:if>
		  </sec:authorize>
		  <sec:authorize access="isAnonymous()"> <!-- 로그인 x -->
		  	<input type="text" class="form-control" name="noticeWriter" id="exampleFormControlInput1" value="비회원" readonly="readonly">
		  </sec:authorize>
		</div>
		
		<div class="mb-3">
		  <label for="exampleFormControlInput1" class="form-label">중요공지(상단고정)</label>
		  <input type="checkbox" name="noticePoint" value="Y">
		</div>
		
		<div class="mb-3">
		  <label for="exampleFormControlTextarea1" class="form-label">내용</label>
		  <textarea class="form-control" name="noticeContent" id="summernote" rows="3"></textarea>
		</div>
		
		<div class="mb-3">
		  <input type="file" class="form-control" name="files" id="files" style="display: none;" multiple="multiple">
		  <!-- input button trigger 용도의 button -->
		  <button type="button" id="trigger" class="btn btn-outline-primary">이미지파일 등록</button>
		</div>
		
		<div class="mb-3" id="fileZone">
		<!-- 첨부파일 표시 영역 -->
		</div>
		<div>
		<button type="submit" class="btn btn-dark" id="regBtn">등록</button>
		</div>
	</form>
</div>

<br><br><br><br><br><br><br><br><br><br><br><br>
<!-- <script type="text/javascript" src="/resources/js/notice/noticeFileUpload.js"></script> -->


<script type="text/javascript">
$('#summernote').summernote({
	height: 300,                 // 에디터 높이
	minHeight: null,             // 최소 높이
	maxHeight: null,             // 최대 높이
	focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
	lang: "ko-KR",					// 한글 설정
	placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
	callbacks: {	//여기 부분이 이미지를 첨부하는 부분
		onImageUpload : function(files) {
			uploadSummernoteImageFile(files[0],this);
		},
		onPaste: function (e) {
			var clipboardData = e.originalEvent.clipboardData;
			if (clipboardData && clipboardData.items && clipboardData.items.length) {
				var item = clipboardData.items[0];
				if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
					e.preventDefault();
				}
			}
		}
	}
});



/**
* 이미지 파일 업로드
*/
function uploadSummernoteImageFile(file, editor) {
data = new FormData();
data.append("file", file);
$.ajax({
data : data,
type : "POST",
url : "/uploadSummernoteImageFile",
contentType : false,
processData : false,
success : function(data) {
	//항상 업로드된 파일의 url이 있어야 한다.
	$(editor).summernote('insertImage', data.url);
}
});
}


$("div.note-editable").on('drop',function(e){
    for(i=0; i< e.originalEvent.dataTransfer.files.length; i++){
    	uploadSummernoteImageFile(e.originalEvent.dataTransfer.files[i],$("#summernote")[0]);
    }
   e.preventDefault();
})
</script>







<!-- <script type="text/javascript">
//summernote 부분 
$(document).ready(function textEdit(){
	jsonArray = [];
	$('#summernote').summernote({
		  height: 600,                 // 에디터 높이
		  minHeight: null,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
		  toolbar: [
			    // [groupName, [list of button]]
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['picture','link','video']],
			    ['view', ['fullscreen', 'help']]
			  ],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
			callbacks: {
		         onImageUpload : function(files, editor, welEditable){

		               // 파일 업로드(다중업로드를 위해 반복문 사용)
		               for (var i = files.length - 1; i >= 0; i--) {
		                   uploadSummernoteImageFile(files[i],
		               this);
		                   }
		               }
		           } 
			
		});
	
	 $('#summernote').summernote('fontSize', '24');
	 
	   function uploadSummernoteImageFile(file, el) {
	       var data = new FormData();	
	       data.append("file",file);
	           $.ajax({
	             url: '/../summer_image.do',
	             type: "POST",
	             enctype: 'multipart/form-data',
	             data: data,
	             cache: false,
	             contentType : false,
	             processData : false,
	             success : function(data) {
	                       var json = JSON.parse(data);
	                       $(el).summernote('editor.insertImage',json["url"]);
	                           jsonArray.push(json["url"]);
	                           jsonFn(jsonArray);
	                   },
	                   error : function(e) {
	                       console.log(e);
	                   }
	               });
	           }
	
}),

function jsonFn(jsonArray){
	console.log(jsonArray);
}

</script> -->







<!-- 이미지 화면100%  -->
<!-- onImageUpload: function(image) {
			         
			             var file = image[0];
			             var reader = new FileReader();
			            reader.onloadend = function() {
			                var image = $('<img>').attr('src',  reader.result);
			                   image.attr('width','100%');
			                $('#summernote').summernote("insertNode", image[0]);
			            }
			           reader.readAsDataURL(file);

			      } -->

<jsp:include page="../common/footer.jsp" />
</body>
</html>