package com.web.www.service;

import java.io.IOException;
import java.util.List;

import org.springframework.http.ResponseEntity;

import com.web.www.domain.pay.PayInfoVO;
import com.web.www.domain.pay.RefundInfoVO;

public interface PayService {

	ResponseEntity<String> registerPay(PayInfoVO pivo) throws IOException;

	/**
	 * @param memberNum
	 * @return 특정 멤버 결제정보 조회
	 */
	List<PayInfoVO> getPayInfoList(long memberNum);

	/**
	 * @param rfiVO
	 * @return 환불 insert 이후 응답값
	 * @throws IOException
	 */
	ResponseEntity<String> payMentRefund(RefundInfoVO rfiVO, long memberNum) throws IOException;

}
