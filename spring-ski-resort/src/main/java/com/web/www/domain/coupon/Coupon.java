package com.web.www.domain.coupon;

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
public class Coupon {
	
	private long memberNum;		// 멤버번호
	private String couponCode;		// 쿠폰 아이디 (고유아이디)
	private String couponStart;	// 쿠폰 시작일	
	private String couponEnd;	// 쿠폰 마감일
}
