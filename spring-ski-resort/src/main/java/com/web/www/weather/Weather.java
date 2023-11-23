package com.web.www.weather;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Weather {
	
	private Double weatherHighTemp; // 최고온도
	private Double weatherLowTemp; // 최고온도
	private String weatherSkyStatus; // 하늘 상태
	private String weatherRainStatus; //강수형태
	private Double weatherAmount; // 강수량
	private Double weatherHumid; // 습도
	private String weatherLast; // 마지막 갱신 시각 (시간 단위)
	
}
