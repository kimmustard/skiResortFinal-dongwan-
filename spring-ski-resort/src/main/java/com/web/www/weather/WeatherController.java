package com.web.www.weather;

import java.io.IOException;
import java.util.List;

import javax.annotation.PostConstruct;

import org.json.simple.parser.ParseException;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Async;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.web.www.handler.WeatherHandler;
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
	private final RegionRead rr;
	private final WeatherDAO wdao;
	private final WeatherHandler wh;
	
	//첫 날씨표시
	@GetMapping(value = "/default", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<WeatherVO> defaultWeather() {
		RegionDTO rdto = new RegionDTO();
		rdto.setRegionChild("홍천군");
		rdto.setRegionGrandChild("홍천읍");
		WeatherVO wvo = wdao.selectDefaultWeather(rdto);
		log.info("해당날씨 출력정보 @@@@@@@@@@@@wvo = {}", wvo);
		
		return new ResponseEntity<WeatherVO>(wvo , HttpStatus.OK) ;
	}
	
	//날씨 테이블 초기설정
	@Async("RegionInit")
	@PostConstruct
	public void initRegion() throws IOException, ParseException {
		int isOk = wdao.searchRegion();
		// 테이블에 지역정보가 있는지 확인
		if(isOk == 0) {
			rr.read();
		}
		
		// XX도, XX시/군 ,XX동순으로 입력합니다.
		//지역정보 가져오기
		List<RegionDTO> regionList = wdao.getRegion();
		log.info("rto test @@@ = {}", regionList);
		
		//api 파싱 반복전 테이블 초기화 한번 실행
		wdao.initWeather();
		for (RegionDTO rdto : regionList) {
		WeatherVO wvo = wh.weatherParser(rdto);
		log.info("parsing check!!! @@@@@ = {}", wvo );
		
		//해당 지역정보로 날씨정보 파싱해서 등록하기
		wdao.insertWeather(wvo);
		log.info(isOk > 0 ? "등록완료" : "에러발생");
			
		}
		
		log.info("작업끝@@@@@@@@@@@@@@@@@");
		
	}
	

}
