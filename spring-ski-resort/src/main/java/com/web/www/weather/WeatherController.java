package com.web.www.weather;

import java.io.IOException;

import org.json.simple.parser.ParseException;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
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
	
	private final WeatherDAO wdao;
	private final WeatherHandler wh;
	
	//날씨정보 갱신
	@GetMapping("/test")
	public void testWeather() throws IOException, ParseException {
		// XX도, XX시/군 ,XX동순으로 입력합니다.
		// 테스트용으로 "홍천읍"을 디폴트로 사용합니다.
		String regionGrandChild = "홍천읍";
		
		//지역정보 가져오기
		RegionDTO rdto = wdao.getRegion(regionGrandChild);
		log.info("rto test @@@ = {}", rdto);
		
		//해당 지역정보로 날씨정보 파싱해서 등록하기
		WeatherVO wvo = wh.weatherParser(rdto);
		log.info("parsing success @@@@@ = {}", wvo);
		wdao.initWeather();
		int isOk = wdao.insertWeather(wvo);
		log.info(isOk > 0 ? "등록완료" : "에러발생");
	}
	
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
}
