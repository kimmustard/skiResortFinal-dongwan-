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

	private long couponUid;	//쿠폰 아이디 (고유 아이디)
	private String couponCheck;	// 사용여부	
	private int couponDay; // 쿠폰 사용기간 (기준)
	private String couponName;	// 쿠폰 이름
	private String couponType;	//쿠폰 타입 (필요에 따라)
	private String couponInt;	//쿠폰 할인율(정수)
	private String couponRate;	//쿠폰 할인율(퍼센트)
}
