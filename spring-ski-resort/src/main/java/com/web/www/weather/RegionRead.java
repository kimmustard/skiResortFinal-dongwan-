package com.web.www.weather;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.web.www.repository.WeatherDAO;
@Component
public class RegionRead {
	
	@Autowired
	private WeatherDAO wdao;
	
	public void read() {
		try {
			 
            // 클래스패스에서 프로퍼티 파일 로드
            InputStream input = RegionRead.class.getClassLoader().getResourceAsStream("WeatherProperties.properties");

            if (input == null) {
                System.out.println("WeatherProperties.properties 정보가 없습니다. 경로를 확인해주세요");
                return;
            }

            // 프로퍼티 읽기
            BufferedReader reader = new BufferedReader(new InputStreamReader(input));
            String line;

            while ((line = reader.readLine()) != null) {
                // 각 라인을 콤마로 분리하여 키와 값을 얻음
                String[] parts = line.split(",");
                RegionVO re = new RegionVO();
                re.setRegionNum(Long.parseLong(parts[0]));
                re.setRegionParent(parts[1]);
                re.setRegionChild(parts[2]);
                re.setRegionGrandChild(parts[3]);
                re.setNx(parts[4]);
                re.setNy(parts[5]);
                wdao.insertRegion(re);
                
            }
            
        } catch (IOException e) {
            e.printStackTrace();
        }
	}
}
