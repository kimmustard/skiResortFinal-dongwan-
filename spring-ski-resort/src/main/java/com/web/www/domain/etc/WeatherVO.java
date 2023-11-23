package com.web.www.domain.etc;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class WeatherVO {

	/**
	 * @날씨정보 
	 * 
	 * 항목값	항목명	단위
	 * POP	강수확률	 %
	 * PTY	강수형태	코드값
	 * R06	6시간 강수량	범주 (1 mm)
	 * REH	습도	 %
	 * S06	6시간 신적설	범주(1 cm)
	 * SKY	하늘상태	코드값
	 * T3H	3시간 기온	 ℃
	 * TMN	아침 최저기온	 ℃
	 * TMX	낮 최고기온	 ℃
	 * UUU	풍속(동서성분)	 m/s
	 * VVV	풍속(남북성분)	 m/s
	 * WAV	파고	 M
	 * VEC	풍향	 m/s
	 * WSD	풍속	1
	 */
	
	private String category;
	private String fcst_Value;
	private String fcst_Date;
	private String fcst_Time;
	
	
	
}
