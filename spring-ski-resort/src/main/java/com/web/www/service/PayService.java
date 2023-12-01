package com.web.www.service;

import java.io.IOException;
import java.util.List;

import org.springframework.http.ResponseEntity;

import com.web.www.domain.pay.PayInfoVO;

public interface PayService {

	ResponseEntity<String> registerPay(PayInfoVO upiDTO) throws IOException;

	/**
	 * @param memberNum
	 * @return 특정 멤버 결제정보 조회
	 */
	List<PayInfoVO> getPayInfoList(long memberNum);

	int payMentRefund(String payImpUid) throws IOException;

}
