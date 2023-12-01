package com.web.www.repository;

import java.util.List;

import com.web.www.weather.RegionDTO;
import com.web.www.weather.RegionVO;
import com.web.www.weather.WeatherVO;

public interface WeatherDAO {
	//지역 할당 쿼리문(테스트 코드에서 최초 1회만 사용합니다.)
	int searchRegion();
	void insertRegion(RegionVO re);

	List<RegionDTO> getRegion();

	void initWeather();
	int insertWeather(WeatherVO wvo);
	
	//특정지역 날씨검색
	WeatherVO selectDefaultWeather(RegionDTO rdto);
	
	List<WeatherVO> selectWeatherList();


}
