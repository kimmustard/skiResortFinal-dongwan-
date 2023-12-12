package com.web.www.domain.pay;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class RefundInfoVO {
	
	private String refundImpUid;
	private String payImpUid;
	private String payMerchantUid;
	private String refundReason;
	private String refundName;
	private String refundAmount;
	private String refundType;
	private String refundRegAt;
	
	private String refundNameType; //결제 물품 타입
	
}
