package com.web.www.repository;

import com.web.www.weather.RegionVO;

public interface WeatherDAO {
	//지역 할당 쿼리문(테스트 코드에서 최초 1회만 사용합니다.)
	void insertRegion(RegionVO re);
}
