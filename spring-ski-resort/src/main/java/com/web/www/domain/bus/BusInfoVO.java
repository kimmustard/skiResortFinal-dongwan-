package com.web.www.domain.bus;

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
public class BusInfoVO {
	private int busNum; // 차량번호
	private String busRegion; // 지역
	private int busPeopleLimit; // 버스 총 정원

}
