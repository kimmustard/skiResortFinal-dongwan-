package com.web.www.service;

import java.util.List;

import com.web.www.domain.pay.PayInfoVO;

public interface PayService {

	void registerPay(PayInfoVO upiDTO);

	/**
	 * @param memberNum
	 * @return 특정 멤버 결제정보 조회
	 */
	List<PayInfoVO> getPayInfoList(long memberNum);

	int refund(String payImpUid);

}
