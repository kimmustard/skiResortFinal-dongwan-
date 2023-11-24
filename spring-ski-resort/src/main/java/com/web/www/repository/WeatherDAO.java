package com.web.www.repository;

import com.web.www.weather.RegionDTO;
import com.web.www.weather.RegionVO;
import com.web.www.weather.WeatherVO;

public interface WeatherDAO {
	//지역 할당 쿼리문(테스트 코드에서 최초 1회만 사용합니다.)
	void initWeather();
	void insertRegion(RegionVO re);

	RegionDTO getRegion(String regionGrandChild);

	void insertWeather(WeatherVO wvo);
	
	//특정지역 날씨검색
	WeatherVO selectDefaultWeather(RegionDTO rdto);


}
