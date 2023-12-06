package com.web.www.domain.coupon;

import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
public class CouponGetDTO {

	private long MemberNum;
	private String couponCode;
	private String couponDay;
	private String couponName;
	private int couponInt;	
	private int couponRate;
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private LocalDateTime couponStart;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private LocalDateTime couponEnd;
}
