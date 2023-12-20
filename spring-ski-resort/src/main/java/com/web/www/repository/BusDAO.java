package com.web.www.repository;

import java.util.List;

import com.web.www.domain.board.PagingVO;
import com.web.www.domain.bus.BusInfoVO;
import com.web.www.domain.bus.BusVO;

public interface BusDAO {

	int busReserve(BusVO bvo);

	int busCount();

	void addBusInfo(BusInfoVO busInfoVO);

	void updateBusCount(BusVO bvo);

	List<BusVO> busReserveList(PagingVO pgvo);

	int busCancel();

}
