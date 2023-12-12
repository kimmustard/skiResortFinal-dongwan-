package com.web.www.domain.pay;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class PayInfoVO {

	//카드사 정보
	private String payImpUid;	//카드사 영수증 번호 ("환불"관련 관리할 때 쓰입니다.)
	private String payMerchantUid; // 회사 주문번호 구성:: "order_no_오늘날짜_시간"으로 구분합니다.
	private String payPg; //결제사 정보 ( 카카오인지 이니시스인지..)
	private String payMethod; //결제 방식	
	private String payName; // 거래 품목 이름
	private String payNameType; //거래 품목 타입
	private long payAmount; //가격
	private String payRegAt; //결제일자
	private String payStatus; //결제상태
	
	//호텔 예약번호
	private String hotelMainNum;
	private int hotelRoomNum;	// 방 관리 번호 확인
	//렌탈 예약번호
	private String rentalMainNum;
	
	
	
	
	//구매자 정보
	private long memberNum;	
	
	private String memberEmail;
	private String memberName;
	private String memberPhoneNum;
	private String memberAddress;
	
	
}
