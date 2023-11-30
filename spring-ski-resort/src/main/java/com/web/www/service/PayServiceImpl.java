package com.web.www.service;

import org.springframework.stereotype.Service;

import com.web.www.domain.pay.UserPayInfoDTO;
import com.web.www.repository.PayDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class PayServiceImpl implements PayService{
	
	private final PayDAO pdao;

	@Override
	public void registerPay(UserPayInfoDTO upiDTO) {
		
		
		
		/*********** 비즈니스 로직 영역 (할인율 등)*********/
		
//		long account = upiDTO.getPayAmount();
		
		
		
		/*********************************/
		
		pdao.registerPay(upiDTO);
		
	}
	
}
