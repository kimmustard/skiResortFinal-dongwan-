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
public class UserPayInfoDTO {

	private String pg; //결제사 정보 ( 카카오인지 이니시스인지..)
	private String payMethod; //결제 방식
	private String merchant_uid; // 상점에서 관리하는 주문번호 구성:: "order_no_오늘날짜_시간"으로 구분합니다.
	private String name; // 거래 품목 이름
	private long amount; //가격
	
	private String memberEmail;
	private String memberName;
	private String memberPhone;
	private String memberAddress;
	
}
