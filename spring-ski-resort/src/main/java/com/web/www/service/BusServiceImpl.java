package com.web.www.service;

import org.springframework.stereotype.Service;

import com.web.www.domain.bus.BusInfoVO;
import com.web.www.domain.bus.BusVO;
import com.web.www.repository.BusDAO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BusServiceImpl implements BusService{
	private final BusDAO bdao;

	@Override
	public int busReserve(BusVO bvo) {
		
		return bdao.busReserve(bvo);
	}

	@Override
	public int busCount() {
		
		return bdao.busCount();
	}

	@Override
	public void addBusInfo(BusInfoVO busInfoVO) {
		bdao.addBusInfo(busInfoVO);
		
	}
}
