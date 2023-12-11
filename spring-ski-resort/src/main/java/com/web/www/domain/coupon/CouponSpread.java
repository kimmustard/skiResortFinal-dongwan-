package com.web.www.domain.coupon;

import javax.validation.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@AllArgsConstructor
public class CouponSpread {

	@NotBlank(message = "공백X")
	private String memberGrade;
	@NotBlank(message = "공백X")
	private String couponCode;
}
