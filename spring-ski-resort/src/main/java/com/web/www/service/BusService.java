package com.web.www.service;

import java.util.List;

import com.web.www.domain.board.PagingVO;
import com.web.www.domain.bus.BusInfoVO;
import com.web.www.domain.bus.BusVO;

public interface BusService {

	int busReserve(BusVO bvo);

	int busCount();

	void addBusInfo(BusInfoVO busInfoVO);

	List<BusVO> busReserveList(PagingVO pgvo);

	void busCancel(int busNum, long memberNum);

}
