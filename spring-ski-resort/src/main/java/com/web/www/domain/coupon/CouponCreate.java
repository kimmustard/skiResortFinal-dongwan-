package com.web.www.domain.coupon;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;

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

	@NotBlank(message = "공백X")
	private String couponCode;
	private String couponAdminCheck;
	private String couponSearch;
	private String couponDupli;
	@Min(value = 1, message = "최소 1 이상 입력하세요.")
	private int couponDay;
	@NotBlank(message = "공백X")
	private String couponName;
	private int couponInt;
	private int couponRate;
	
	//변환전 임시 할인 저장
	@Min(value = 1, message = "최소 1 이상 입력하세요.")
	private int defaultAmount;
}
