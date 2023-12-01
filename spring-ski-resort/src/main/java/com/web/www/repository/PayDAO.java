package com.web.www.repository;

import java.util.List;

import com.web.www.domain.pay.PayInfoVO;

public interface PayDAO {

	/**
	 * 멤버 결제정보 등록
	 * @param upiDTO
	 */
	void registerPay(PayInfoVO upiDTO);

	/**
	 * @param memberNum
	 * @return 멤버정보 조히
	 */
	List<PayInfoVO> getPayInfoList(long memberNum);

	int payMentRefund(String payImpUid);

}
