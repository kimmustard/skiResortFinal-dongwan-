package com.web.www.weather;

import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class Region {
	

    private Long id; // 지역 순번
    private String parentRegion; // 시, 도
    private String childRegion; // 시, 군, 구
    private int nx; // x좌표
    private int ny; // y좌표
	
	private Weather weather; // 지역 날씨 정보

    // 날씨 정보 제외하고 지역 생성
    public Region(Long id, String parentRegion, String childRegion, int nx, int ny) {
        this.id = id;
        this.parentRegion = parentRegion;
        this.childRegion = childRegion;
        this.nx = nx;
        this.ny = ny;
    }

    // 날씨 갱신
    public void updateRegionWeather(Weather weather) {
        this.weather = weather;
    }
    
    @Override
    public String toString() {
        return parentRegion + " " + childRegion;
    }
	
	
}
