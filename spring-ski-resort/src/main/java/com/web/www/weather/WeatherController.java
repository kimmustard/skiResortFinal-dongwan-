package com.web.www.weather;

import javax.annotation.PostConstruct;


import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.web.www.repository.WeatherDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/weather/*")
@RequiredArgsConstructor
public class WeatherController {
	
	
	/**
	 * @WeatherDAO 날씨 Repository입니다.
	 * @WeatherHandler 날씨 api 획득/파싱 관련 클래스입니다.
	 */
	private final RegionRead rgr;
	private final WeatherDAO wdao;
	
	//첫 날씨표시
	@GetMapping(value = "/default", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<WeatherVO> defaultWeather() {
		RegionDTO rdto = new RegionDTO();
		rdto.setRegionChild("홍천군");
		rdto.setRegionGrandChild("홍천읍");
		WeatherVO wvo = wdao.selectDefaultWeather(rdto);
		
		return new ResponseEntity<WeatherVO>(wvo , HttpStatus.OK);
	}
	
	//서버 실행시 지역 테이블 초기설정
	@PostConstruct
	public void initRegion(){
	
		int isOk = wdao.searchRegion();
		// 테이블에 지역정보가 있는지 확인
		if(isOk == 0) {
			rgr.read();
		}
		
	}
	

}
