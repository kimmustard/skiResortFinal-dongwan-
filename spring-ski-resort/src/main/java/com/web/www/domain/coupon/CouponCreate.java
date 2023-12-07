package com.web.www.domain.coupon;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class CouponCreate {

	private String CouponCode;
	private String CouponAdminCheck;
	private String CouponSearch;
	private String CouponDupli;
	private int CouponDay;
	private String CouponName;
	private int CouponInt;
	private int CouponRate;
	
	//변환전 임시 할인 저장
	private int DefaultAmount;
}
