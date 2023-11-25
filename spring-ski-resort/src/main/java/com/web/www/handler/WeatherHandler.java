package com.web.www.handler;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.ProtocolException;
import java.net.URL;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

import com.web.www.weather.RegionDTO;
import com.web.www.weather.WeatherVO;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
@PropertySource("classpath:outApiProperties.properties")
public class WeatherHandler {
	
	/**
	 * @공식문서 API url,key 정보 입력
	 */
	@Value("${weather.url}")
	private String weather_Url;
	@Value("${weather.key}")
	private String weather_Key;
    
   public WeatherVO weatherParser(RegionDTO rdto) throws IOException, ParseException{
    	
        /**
         * 기상청 날씨 데이터는 하루에 8번 갱신한다.
         * (2시 5시 8시 11시 14시 17시 20시 23시)
         * 더 자세히 말하자면 실제 갱신시간은 2시10분 5시10분 8시10분.. 이다.
         * 
         * 기상청 날씨 API는 새벽 2시 이전 값을 가져올 수 없다.
         * 만약 가지고 오려고하면 에러가 뜬다. 
         * 이문제를 방지하기 위해 그전날인 23시값을 가져오게 한다.
         */
      
        LocalDate now = LocalDate.now();
        LocalTime nowTime = LocalTime.now();
        DateTimeFormatter formatter1 = DateTimeFormatter.ofPattern("yyyyMMdd");
        DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("HH00");

        int currentHour = Integer.parseInt(nowTime.format(formatter2));
        /**
         * @currentHour 현재시간 비례해서 api시간 가져오기
         */
        if (currentHour <= 211) {
            now = now.minusDays(1);
            currentHour = 2300;
        } else if (currentHour <= 511) {
            currentHour = 200;
        } else if (currentHour <= 811) {
            currentHour = 500;
        } else if (currentHour <= 1111) {
            currentHour = 800;
        } else if (currentHour <= 1411) {
            currentHour = 1100;
        } else if (currentHour <= 1711) {
            currentHour = 1400;
        } else if (currentHour <= 2011) {
            currentHour = 1700;
        } else if (currentHour <= 2311) {
            currentHour = 2000;
        } else {
            now = now.minusDays(1);
            currentHour = 2300;
        }
        
        log.info("API 정보를 가져올 시간@@ = " + currentHour);

        String nx = rdto.getNx();	//위도
        String ny = rdto.getNy();	//경도
        String baseDate = now.format(formatter1);	//조회하고싶은 날짜
        String baseTime = String.valueOf(currentHour);	//조회하고싶은 시간
        String type = "json";	//조회하고 싶은 type(json, xml 중 고름)
        
        log.info("날짜체크@@@@@ = {}", baseDate);
        log.info("시간체크@@@@@ = {}", baseTime);

        StringBuilder urlBuilder = new StringBuilder(weather_Url);
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "="+weather_Key);
        urlBuilder.append("&" + URLEncoder.encode("nx","UTF-8") + "=" + URLEncoder.encode(nx, "UTF-8")); //경도
        urlBuilder.append("&" + URLEncoder.encode("ny","UTF-8") + "=" + URLEncoder.encode(ny, "UTF-8")); //위도
        urlBuilder.append("&" + URLEncoder.encode("base_date","UTF-8") + "=" + URLEncoder.encode(baseDate, "UTF-8")); /* 조회하고싶은 날짜*/
        urlBuilder.append("&" + URLEncoder.encode("base_time","UTF-8") + "=" + URLEncoder.encode(baseTime, "UTF-8")); /* 조회하고싶은 시간 AM 02시부터 3시간 단위 */
        urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode(type, "UTF-8"));	/* 타입 */

        /*
         * GET방식으로 전송해서 파라미터 받아오기
         */
        URL url = new URL(urlBuilder.toString());

        HttpURLConnection conn = createHttpURLConnection(url);
        
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

        //받아온 api정보를 JSON simple을 이용하여 파싱 시작
        
        JSONParser parser = new JSONParser(); 
		Object obj = (JSONObject) parser.parse(result); 
		
        
        // response 키를 가지고 데이터를 파싱
        JSONObject jsonObj_1 = (JSONObject) obj;
        JSONObject response = (JSONObject) jsonObj_1.get("response");
        JSONObject body = (JSONObject) response.get("body");
        JSONObject items = (JSONObject) body.get("items");
        JSONArray parse_item = (JSONArray) items.get("item");
        log.info("items = {}", items);
        
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

	private static HttpURLConnection createHttpURLConnection(URL url) throws IOException, ProtocolException {
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        log.info("Response code = {} ", conn.getResponseCode());
		return conn;
	}

    
}
