package com.web.www.repository;

import com.web.www.domain.bus.BusInfoVO;
import com.web.www.domain.bus.BusVO;

public interface BusDAO {

	int busReserve(BusVO bvo);

	int busCount();

	void addBusInfo(BusInfoVO busInfoVO);

	void updateBusCount(BusVO bvo);

}
