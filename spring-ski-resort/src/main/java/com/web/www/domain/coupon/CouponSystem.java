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
	private int couponInt;	//쿠폰 할인율(정수)
	private int couponRate;	//쿠폰 할인율(퍼센트)
	
	
	//쿠폰 생성용 생성자
	public CouponSystem(int couponDay, String couponName, String couponType, int couponInt, int couponRate) {
		this.couponDay = couponDay;
		this.couponName = couponName;
		this.couponType = couponType;
		this.couponInt = couponInt;
		this.couponRate = couponRate;
	}
	
	
}
