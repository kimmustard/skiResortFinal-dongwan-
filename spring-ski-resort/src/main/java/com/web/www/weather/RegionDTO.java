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
	
    private Long regionNum; // 지역 순번
    private String regionParent; // 시, 도
    private String regionChild; // 시, 군, 구
    private String regionGrandChild;
    private String nx; // x좌표
    private String ny; // y좌표
    

	
}
