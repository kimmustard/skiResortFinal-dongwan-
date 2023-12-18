<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/hotel/roomDetail.css">
</head>
<body>
		
		<jsp:include page="../common/nav.jsp"></jsp:include>
		
	<div id="room_detail">
	
				<div class="room_detail_title_box">
					<h3 class="room_title">스탠다드 트윈</h3>
				</div>

				<div id="room_detail_img">
						 <div class="slide_wrapper">
						      <ul class="slides">
						        <li><img width="100%" height ="670px" src="${rivo.hotelRoomImage1}" alt=""/> </li>
						        <li><img width="100%" height ="670px" src="${rivo.hotelRoomImage2}" alt=""/> </li>
						        <li><img width="100%" height ="670px" src="${rivo.hotelRoomImage3}" alt=""/> </li>
						        <li><img width="100%" height ="670px" src="${rivo.hotelRoomImage4}" alt=""/> </li>
						       
						     
				      </ul>
						
						</div>
				  
					      <div class="prev controls left-control">이전<i class="bi bi-chevron-compact-left"></i></div>
					      <div class="next controls right-control" >다음<i class="bi bi-chevron-compact-right"></i></div>
					
				</div><!-- #room_detail_img 종료 -->

					

				<div class="wrap">
					<p class="detail_br_text">
						<span class="guidance"><i class="xi_icon xi-info-o"></i> 같은 타입의 객실일지라도 상기 이미지와 다를 수 있습니다.</span>
						
					
						
					</p>
					<div id="room_info_2">
						<div class="left_text">최고의 호텔 서비스를 부담 없는 가격으로</div>
						<div class="right_text"><p style="line-height: 1.2; font-family: 굴림; font-size: 12pt; margin-top: 0px; margin-bottom: 0px;">온돌과 더블온돌 및 트윈, 헐리우드, 더블 등 다섯 가지의 타입의 객실이 있습니다. 한실 구조의 온돌은 유리장과 벽지를 한지로 마감하여 아늑하고 은은한 한식의 분위기가 방안 가득히 배어나는 고급 한옥의 정갈한 맛을 더해 드립니다.</p></div>
					</div>
					<!--  개요 영역 시작 -->
					<div id="room_info_3">
						<table class="room_table">
						
						<thead>
						<tr>
							<th class="room_table_head">
								<span class="icon room_icon_line"></span>객실명
							</th>
							<th>
								<span class="icon room_icon_line"></span>객실코드
							</th>
							<th>
								<span class="icon room_icon_1"></span>이용요금(1박)
							</th>
							<th>
								<span class="icon room_icon_2"></span>기준인원
							</th>
							<th>
								<span class="icon room_icon_3"></span>객실수
							</th>
							<th>
								<span class="icon room_icon_4"></span>면적
							</th>
							<th>
								<span class="icon room_icon_5"></span>체크인/<br>체크아웃
							</th>
						</tr>
						</thead>
						<tbody class="text_center">
						<tr>
							<td class="text_left">
								<span class="room_text_1"><span class="info_title room_name"></span><strong>${rvo.hotelRoomName }</strong></span>
							</td>
							<td>
								<span class="room_text_2"><span class="info_title room_cod"></span><strong> ${rvo.hotelRoomNum}</strong></span>
							</td>
							<td>
								<span class="room_text_3"><span class="info_title room_charge"></span><strong> ${rvo.hotelRoomFee}</strong>원</span>
							</td>
							<td>
								<span class="room_text_2"><span class="info_title room_personnel"></span><strong>${rvo.hotelRoomStandardPeople}</strong>명<!--(3명)--></span>
							</td>
							<td>
								<span class="room_text_2"><span class="info_title room_number"></span><strong>${rvo.hotelRoomCount }</strong>개</span>
							</td>
							<td>
								<span class="room_text_2"><span class="info_title room_area"></span><strong>${rvo.hotelRoomArea}</strong></span>
							</td>
							<td>
								<span class="room_text_2"><span class="room_checkin"></span>PM<strong>03</strong> / AM<strong>11</strong></span>
							</td>
						</tr>
						</tbody>
						</table>
					</div>
				</div>
				<!--  개요 영역 종료 -->
				<!-- 비품영역 시작  -->
				<div id="room_info_4">
					<div class="wrap">
						<h3 class="h0">제공서비스</h3>
						<div class="wh_box">
							<h4 class="h0">비품/소모품류</h4>
							<ul>
								<li><span class="title">타올류</span><span class="text">베스타올, 페이스타올, 룸가운</span></li>
								<li><span class="title">비품류</span><span class="text">LCD TV, 전기포트, 헤어드라이기, 커피 컵, 글라스 류, 금고, 슬리퍼</span></li>
								
								<li><span class="title">소모품류</span><span class="text">욕실용품(샴푸,린스,샤워젤,로션,비누), 샤워캡, 머리빗, 바늘쌈지</span></li>
								<li><span class="title">인쇄물류</span><span class="text">편지봉투, 편지지, 메모지, 엽서, 고객설문지, 잡지책 등</span></li>
								
								<li><span class="title">대여용품</span><span class="text">빗류(브러시,롤빗), 헤어젤, 헤어스프레이, 헤어무스, 면도크림, 남성화장품(스킨,로션), 가습기, 바둑/장기판, 다리미/판, Baby crib, 노트북(유료대여)</span></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- 비품영역 종료  -->
				
				<div class="wrap">
				
					<!--  유의사항 영역 시작 -->
					<div class="box1">
						<div class="box1_wrap" style="white-space:pre-line">
							<h3 class="h0">유의사항</h3>
								- 이용요금은 세금과 봉사료 포함이며, 침구 추가 시 별도 요금이 부과됩니다. 
 - 이용요금은 하이원 그랜드호텔(메인타워) 운영 정책 및 성수기/비 성수기에 따라 변동 가능합니다.(문의 1588-7789) 
 - 수건은 1박 투숙시 객실 정원 수 만큼 제공됩니다. 
 - 22시 이후 입실할 경우 사전에 프런트로 연락 주시기 바랍니다. 
 - 퇴실 전 객실 점검을 위해 프런트로 연락 주시기 바랍니다. (퇴실 시간은 성수기/비 성수기에 따라 변경 됩니다.) 
 - 반려 동물 반입 금지 (동반 시 벨 데스크로 방문하여 보관 후 입실) 
 - 객실 내 휴대용 버너 및 전기 조리 기구 사용금지 (화재예방 차원) 
 - 객실 비품 훼손 및 불출 금지 (가구 이동을 삼가 주시기 바랍니다) 
 - 귀중품(현금포함) 보관 : 객실 내 비치된 금고 또는 프런트에 보관 (보관하지 않은 분실물에 대한 보상 불가) 
 - 고성방가 금지 
 - 분실물 처리 : 하우스키핑에 접수/보관되며, 고객 요청 시 확인 후 택배(착불요금)로 발송 
   분실물 문의 시 예약번호, 객실번호를 확인해 주시면 신속하게 확인 가능 
   습득물은 유실물 법에 의거 폐기 또는 매주 월요일 관할경찰서(정선경찰서)로 인계 
 - 단, 단체 예약의 경우 계약사항에 따라 변동 될 수 있습니다.
						</div>
					</div>
					<!--  유의사항 영역 종료 -->
				</div>
				
			</div>
		
		<jsp:include page="../common/footer.jsp"></jsp:include>		
		
</body>
	<script type="text/javascript" src="/resources/js/hotel/roomDetail.js"></script>
</html>