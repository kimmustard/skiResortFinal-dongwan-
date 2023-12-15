package com.web.www.domain.pay;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class ReceiptDTO {

	/**
	 * @영수증 정보입니다.
	 */
	
	//1. 결제정보 가져오기
	private String payMerchantUid;
	private String payStatus;
	private String memberNum;
	private String memberType;
	private String payPg;
	
	//구매자 정보
	private String memberId;
	private String memberEmail;
	private String memberName;
	private String memberPhoneNum;
	private String payRegAt;
	private String payName;
	private String payAmount; 
	private String payNameType;
	
	//구매중인 물건 기타정보 (사람수, 시작일, 종료일)
	private String hotelReservePeople;
	private String hotelReserveChild;
	private String hotelReserveStayStart;
	private String hotelReserveStayEnd;
	
	private String rentalLiftTicket;	//리프트권 이름
	private String rentalLiftStart;
	private String rentalLiftAdult;
	private String rentalLiftKid;
	
	private String rentalReserveAdult;
	private String rentalReserveKid;
	private String rentalReserveStart;
	
	//환불정보
	private String refundImpUid;
	private String refundReason;
	private String refundType;
	private String refundRegAt;
}
