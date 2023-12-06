package com.web.www.domain.coupon;

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
public class CouponSystem {

	private String couponCode;	//쿠폰 아이디 (고유 아이디)
	private String couponAdminCheck;	// 관리자가 쿠폰 사용여부 결정	
	private String couponSearch;	// 코드입력 사용여부	
	private String couponDupli;	// 중복보유 여부	
	private int couponDay; // 쿠폰 사용기간 (기준)
	private String couponName;	// 쿠폰 이름
	private int couponInt;	//쿠폰 할인율(정수)
	private int couponRate;	//쿠폰 할인율(퍼센트)

	
}
