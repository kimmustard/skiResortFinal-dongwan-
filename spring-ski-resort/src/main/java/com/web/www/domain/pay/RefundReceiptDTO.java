package com.web.www.domain.pay;

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
public class RefundReceiptDTO {

	//환불정보
	private String refundImpUid;
	private String refundReason;
	private String refundType;
	private String refundRegAt;
}
