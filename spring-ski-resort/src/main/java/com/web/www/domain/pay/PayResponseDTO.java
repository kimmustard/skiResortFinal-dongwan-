package com.web.www.domain.pay;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class PayResponseDTO {

	private String payMerchantUid;
	private String payName;
	private long payAmount;
}
