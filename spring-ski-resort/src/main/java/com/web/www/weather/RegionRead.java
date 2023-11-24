package com.web.www.weather;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;


import lombok.extern.slf4j.Slf4j;

@Slf4j
public class RegionRead {
	
	 public static void main(String[] args) {
	        

	        try {
	        	
	        	
	            // 클래스패스에서 프로퍼티 파일 로드
	            InputStream input = RegionRead.class.getClassLoader().getResourceAsStream("WeatherProperties.properties");

	            if (input == null) {
	                System.out.println("Sorry, unable to find WeatherProperties.properties");
	                return;
	            }

	            // 프로퍼티 읽기
	            BufferedReader reader = new BufferedReader(new InputStreamReader(input));
	            String line;

	            while ((line = reader.readLine()) != null) {
	                // 각 라인을 콤마로 분리하여 키와 값을 얻음
	                String[] parts = line.split(",");
	                RegionVO re = new RegionVO();
	                re.setRegionParent(parts[1]);
	                re.setRegionChild(parts[2]);
	                re.setRegionGrandChild(parts[3]);
	                re.setNx(Integer.parseInt(parts[4]));
	                re.setNy(Integer.parseInt(parts[5]));
	                log.info("re = {}@@@@@@@@@@", re);
	                
	                
	            }
	            
	        } catch (IOException e) {
	            e.printStackTrace();
	        }

	    }

}
