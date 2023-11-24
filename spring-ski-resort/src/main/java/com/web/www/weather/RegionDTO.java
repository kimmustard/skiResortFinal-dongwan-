package com.web.www.weather;

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
public class RegionDTO {
	
	private long regionNum; //지역번호
	private String nx; // x좌표
	private String ny; // y좌표
	
}
