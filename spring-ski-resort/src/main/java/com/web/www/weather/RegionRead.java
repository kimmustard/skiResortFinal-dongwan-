package com.web.www.weather;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class RegionRead {

	public static void main(String[] args) {
			Properties properties = new Properties();
			File file = new File("classpath:WeatherProperties.properties");
			
			
		 try {
	            // 파일에서 프로퍼티 읽기
	            properties.load(new FileInputStream(file));
	        } catch (IOException e) {
	            e.printStackTrace();
	        }

	        // 특정 키에 해당하는 값 가져오기
	        String value = properties.getProperty("1");

	        // 가져온 값 출력
	        System.out.println("Value for key '1': " + value);
	}
	
	public void RegionReadAll() {
		 Properties properties = new Properties();
		 
		 try {
	            // 파일에서 프로퍼티 읽기
	            properties.load(new FileInputStream("classpath:WeatherProperties.properties"));
	        } catch (IOException e) {
	            e.printStackTrace();
	        }

	        // 특정 키에 해당하는 값 가져오기
	        String value = properties.getProperty("1");

	        // 가져온 값 출력
	        System.out.println("Value for key '1': " + value);
	}
}
