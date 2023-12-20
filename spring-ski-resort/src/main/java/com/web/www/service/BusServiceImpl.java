package com.web.www.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.www.domain.board.PagingVO;
import com.web.www.domain.bus.BusInfoVO;
import com.web.www.domain.bus.BusVO;
import com.web.www.repository.BusDAO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BusServiceImpl implements BusService{
	private final BusDAO bdao;

	@Transactional
	@Override
	public int busReserve(BusVO bvo) {
		bdao.updateBusCount(bvo);
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

	@Override
	public List<BusVO> busReserveList(PagingVO pgvo) {
		
		return bdao.busReserveList(pgvo);
	}

	@Override
	public int busCancel() {
		
		return bdao.busCancel();
	}
}
