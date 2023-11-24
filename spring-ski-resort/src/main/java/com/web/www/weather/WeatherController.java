package com.web.www.weather;

import java.io.IOException;

import org.json.simple.parser.ParseException;
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
	
	
	@GetMapping("/test")
	public String testWeather() throws IOException, ParseException {
		// XX도, XX시/군 ,XX동순으로 입력합니다.
		// 테스트용으로 "홍천읍"을 디폴트로 사용합니다.
		String regionGrandChild = "홍천읍";
		RegionDTO rdto = wdao.getRegion(regionGrandChild);
		log.info("rto test @@@ = {}", rdto);
		wh.weatherParser(rdto);
		
		
	
		return "test";
	}
	
	@GetMapping("/default")
	public String defaultWeather() {
		
		
		
		return "test";
	}
}
