package com.web.www.repository;

import com.web.www.domain.pay.UserPayInfoDTO;

public interface PayDAO {

	void registerPay(UserPayInfoDTO upiDTO);

}
