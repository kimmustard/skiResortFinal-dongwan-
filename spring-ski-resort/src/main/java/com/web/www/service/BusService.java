package com.web.www.service;

import com.web.www.domain.bus.BusInfoVO;
import com.web.www.domain.bus.BusVO;

public interface BusService {

	int busReserve(BusVO bvo);

	int busCount();

	void addBusInfo(BusInfoVO busInfoVO);

}
