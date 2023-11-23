package com.web.www.weather;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@ToString
public class RegionVO {
	

    private Long regionNum; // 지역 순번
    private String regionParent; // 시, 도
    private String regionChild; // 시, 군, 구
    private String regionGrandChild;
    private int nx; // x좌표
    private int ny; // y좌표
	
	private Weather weather; // 지역 날씨 정보

	public RegionVO(Long regionNum, String regionParent, String regionChild, String regionGrandChild, int nx, int ny) {
		this.regionNum = regionNum;
		this.regionParent = regionParent;
		this.regionChild = regionChild;
		this.regionGrandChild = regionGrandChild;
		this.nx = nx;
		this.ny = ny;
	}
 
    // 날씨 갱신
    public void updateRegionWeather(Weather weather) {
        this.weather = weather;
    }
    
//    @Override
//    public String toString() {
//        return regionParent + " " + regionChild + " " + regionGrandChild;
//    }

	
	
}
