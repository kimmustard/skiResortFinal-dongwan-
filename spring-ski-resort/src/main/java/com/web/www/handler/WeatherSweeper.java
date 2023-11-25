package com.web.www.handler;

import java.io.IOException;
import java.util.List;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.web.www.repository.WeatherDAO;
import com.web.www.weather.RegionDTO;
import com.web.www.weather.WeatherVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class WeatherSweeper {
	
	/**
	 * @Lazy 순환참조가 생길 수 있으니 나중에 문제생기면 추가
	 */
	@Autowired
	private WeatherHandler wh;
	
	@Autowired
	private WeatherDAO wdao;
	
	/**
	 * 스케줄링 시간 3시간 쿨타임
	 * @Async 스케줄러는 default 싱글 스레드이기 때문에 작업속도 때문에 비동기 사용
	 * 기존 핸들러에서 발생한 체크예외는 (throws IOException, ParseException) 
	 * 언체크예외로 변경하여 종속성을 삭제한다.
	 */
	@Async("WeatherInit")
	@Scheduled(fixedRate = 3 * 60 * 60 * 1000)
	public void WeatherApiRenewal(){
		log.info("날씨api(갱신) 스케줄러 [시작]합니다.");
		try {
			List<RegionDTO> regionList = wdao.getRegion();
			
			wdao.initWeather();
			//api 파싱 반복전 테이블 초기화 한번 실행
			for (RegionDTO rdto : regionList) {
				WeatherVO wvo = wh.weatherParser(rdto);
				
				//해당 지역정보로 날씨정보 파싱해서 등록하기
				wdao.insertWeather(wvo);
				
			}
		} catch (IOException | ParseException e) {
			throw new RuntimeException("날씨 정보 갱신 중 오류 발생", e);
		} 
		
		log.info("날씨api(갱신) 스케줄러 [종료]합니다.");
	}
	
}
