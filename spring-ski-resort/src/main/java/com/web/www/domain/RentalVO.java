package com.web.www.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class RentalVO {
	private long rentalMainNum; // 렌탈 예약번호
	private long memberNum; // 회원번호
	private long rentalShopNum; // 업체번호
	private String rentalMainIsreturn; // 반납 서비스 여부
	private String rentalMainLift; // 리프트권 구매 여부
}
