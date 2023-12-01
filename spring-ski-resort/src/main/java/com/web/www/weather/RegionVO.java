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
    private String nx; // x좌표
    private String ny; // y좌표
	
	private WeatherVO weather; // 지역 날씨 정보

	public RegionVO(Long regionNum, String regionParent, String regionChild, String regionGrandChild, String nx, String ny) {
		this.regionNum = regionNum;
		this.regionParent = regionParent;
		this.regionChild = regionChild;
		this.regionGrandChild = regionGrandChild;
		this.nx = nx;
		this.ny = ny;
	}
	
	//동네 검색시 사용(핵심)
	public RegionVO(String regionGrandChild) {
		this.regionGrandChild = regionGrandChild;
	}
	
	//지역 검색시 사용
	public RegionVO(String regionParent, String regionChild, String regionGrandChild) {
		this.regionParent = regionParent;
		this.regionChild = regionChild;
		this.regionGrandChild = regionGrandChild;
	}
	
	
 
    // 날씨 갱신
    public void updateRegionWeather(WeatherVO weather) {
        this.weather = weather;
    }


//    @Override
//    public String toString() {
//        return regionParent + " " + regionChild + " " + regionGrandChild;
//    }

	
	
}
