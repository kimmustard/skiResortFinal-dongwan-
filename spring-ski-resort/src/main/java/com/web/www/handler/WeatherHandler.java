package com.web.www.handler;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Component;

import com.web.www.weather.RegionDTO;
import com.web.www.weather.WeatherVO;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class WeatherHandler {
    
    public WeatherVO weatherParser(RegionDTO rdto) throws IOException, ParseException{
    	
    	log.info("weatherParser 진입@@@@@@@@@@@");
    	log.info("weatherParser 진입@@@@@@@@@@@");
    	
    	
    	/**
    	 * @공식문서 API url,key 정보 입력
    	 */
        String apiUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst";
        String serviceKey = "UET%2FDPGx91mRuA4f2s%2BPcV5n%2BBw5%2BWvhYpd%2BElBlMe229wafGbuz3whtGBHW5GqJp5k1%2FdwR8bQgTSj%2Fx8kwwA%3D%3D";
       
        
        //오늘 날씨 계산기
        String dateTime = LocalDate.now()
        		.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"))
        		.replaceAll("[^0-9]", "");
        
        String nx = rdto.getNx();	//위도
        String ny = rdto.getNy();	//경도
        String baseDate = dateTime;	//조회하고싶은 날짜
        String baseTime = "0500";	//조회하고싶은 시간
        String type = "json";	//조회하고 싶은 type(json, xml 중 고름)

        StringBuilder urlBuilder = new StringBuilder(apiUrl);
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "="+serviceKey);
        urlBuilder.append("&" + URLEncoder.encode("nx","UTF-8") + "=" + URLEncoder.encode(nx, "UTF-8")); //경도
        urlBuilder.append("&" + URLEncoder.encode("ny","UTF-8") + "=" + URLEncoder.encode(ny, "UTF-8")); //위도
        urlBuilder.append("&" + URLEncoder.encode("base_date","UTF-8") + "=" + URLEncoder.encode(baseDate, "UTF-8")); /* 조회하고싶은 날짜*/
        urlBuilder.append("&" + URLEncoder.encode("base_time","UTF-8") + "=" + URLEncoder.encode(baseTime, "UTF-8")); /* 조회하고싶은 시간 AM 02시부터 3시간 단위 */
        urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode(type, "UTF-8"));	/* 타입 */

        /*
         * GET방식으로 전송해서 파라미터 받아오기
         */
        URL url = new URL(urlBuilder.toString());

        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        log.info("Response code = {} ", conn.getResponseCode());
        
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        
        rd.close();
        conn.disconnect();
        String result= sb.toString();

        //=======이 밑에 부터는 json에서 데이터 파싱해 오는 부분이다=====//
        
        JSONParser parser = new JSONParser(); 
		Object obj = (JSONObject) parser.parse(result); 
		
        
        // response 키를 가지고 데이터를 파싱
        JSONObject jsonObj_1 = (JSONObject) obj;
        JSONObject response = (JSONObject) jsonObj_1.get("response");
        JSONObject body = (JSONObject) response.get("body");
        JSONObject items = (JSONObject) body.get("items");
        JSONArray parse_item = (JSONArray) items.get("item");
        log.info("items = {}", items);

        Map<String, WeatherVO> WeatherMap = new HashMap<>();
        
        WeatherVO wvo = new WeatherVO();
        
        for(int i=0; i<parse_item.size(); i++) {
        	JSONObject weather = (JSONObject) parse_item.get(i);
        	String fcstValue = (String) weather.get("fcstValue");
        	String fcstDate = (String) weather.get("fcstDate");
        	String fcstTime = (String) weather.get("fcstTime");
        	String category = (String)weather.get("category"); 
        	
        	
        	
        	//카테고리 별 밸류값 분류
        	if(category.equals("TMP")) {	//1시간 기온
        		wvo.setWeatherTemp(fcstValue);
        	}else if(category.equals("SKY")) {	//하늘상태
        		
        		if(fcstValue.equals("1")) {
        			wvo.setWeatherSkyStatus("맑음");
        		}else if(fcstValue.equals("3")) {
        			wvo.setWeatherSkyStatus("구름많음");
        		}else if(fcstValue.equals("4")) {
        			wvo.setWeatherSkyStatus("흐림");
        		}else {
        			wvo.setWeatherSkyStatus("정보없음");
        		}
        		
        	}else if(category.equals("PTY")) {	//강수형태
        		wvo.setWeatherRainStatus(fcstValue);
        		
        		if(fcstValue.equals("0")) {
        			wvo.setWeatherRainStatus("없음");
        		}else if(fcstValue.equals("1")) {
        			wvo.setWeatherRainStatus("비");
        		}else if(fcstValue.equals("2")) {
        			wvo.setWeatherRainStatus("비/눈");
        		}else if(fcstValue.equals("3")) {
        			wvo.setWeatherRainStatus("눈");
        		}else if(fcstValue.equals("4")) {
        			wvo.setWeatherRainStatus("소나기");
        		}else {
        			wvo.setWeatherRainStatus("정보없음");
        		}
        		
        	}else if(category.equals("POP")) {	//강수확률
        		wvo.setWeatherPer(fcstValue);
        	}else if(category.equals("PCP")) {	//강수량
        		wvo.setWeatherAmount(fcstValue);
        	}
        	
        	wvo.setWeatherDate(fcstDate);
        	wvo.setWeatherTime(fcstTime);
        	wvo.setRegionNum(rdto.getRegionNum());
        	
        }
        return wvo;
        
        
        

    }

    
}
