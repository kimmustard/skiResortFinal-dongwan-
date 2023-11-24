package com.web.www.weather;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class WeatherVO {
	
	private long regionNum; //지역번호
	private String weatherHighTemp; // 최고온도 TMN
	private String weatherLowTemp; // 최고온도
	private String weatherTemp; // 현재기온
	private String weatherSkyStatus; // 하늘 상태
	private String weatherRainStatus; //강수형태
	private String weatherAmount; // 강수량
	private String weatherPer; //강수량
	private String weatherDate; // 마지막 갱신 날짜
	private String weatherTime;	// 마지막 갱신 시간
	
}
