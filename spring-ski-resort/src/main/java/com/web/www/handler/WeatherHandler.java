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

import com.web.www.domain.etc.WeatherVO;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class WeatherHandler {
	
	//오늘 날씨 계산기
	String str = LocalDate.now()
						  .format(DateTimeFormatter.ofPattern("yyyy-MM-dd"))
						  .replaceAll("[^0-9]", "");
	
	private String nx = "73";	//위도
    private String ny = "134";	//경도
    private String baseDate = str;	//조회하고싶은 날짜
    private String baseTime = "0500";	//조회하고싶은 시간
    private String type = "json";	//조회하고 싶은 type(json, xml 중 고름)
    
    
    public void weatherParser() throws IOException, ParseException{

    	//		참고문서에 있는 url주소
        String apiUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst";
        
        //         홈페이지에서 받은 키
        String serviceKey = "UET%2FDPGx91mRuA4f2s%2BPcV5n%2BBw5%2BWvhYpd%2BElBlMe229wafGbuz3whtGBHW5GqJp5k1%2FdwR8bQgTSj%2Fx8kwwA%3D%3D";

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
        System.out.println("Response code: " + conn.getResponseCode());
        
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
        
        log.info("날씨정보@@@@@@@@@@@@@@@ = {}",result);
        
        JSONParser parser = new JSONParser(); 
		Object obj = (JSONObject) parser.parse(result); 
		
        
        // response 키를 가지고 데이터를 파싱
        JSONObject jsonObj_1 = (JSONObject) obj;
        JSONObject response = (JSONObject) jsonObj_1.get("response");
        JSONObject body = (JSONObject) response.get("body");
        JSONObject items = (JSONObject) body.get("items");
        JSONArray parse_item = (JSONArray) items.get("item");
        log.info("items = {}", items);
        
    	String category;
		JSONObject weather;
		String day="";
		String time="";
        Map<String, WeatherVO> WeatherMap = new HashMap<>();
		
        for(int i=0; i<parse_item.size(); i++) {
        	WeatherVO wvo = new WeatherVO();
        	weather = (JSONObject) parse_item.get(i);
        	String fcstValue = (String) weather.get("fcstValue");
        	String fcstDate = (String) weather.get("fcstDate");
        	String fcstTime = (String) weather.get("fcstTime");
        	category = (String)weather.get("category"); 
        	
//        	wvo.setFcst_Value(fcstValue);
//        	wvo.setFcst_Date(fcstDate);
//        	wvo.setFcst_Time(fcstTime);
//        	wvo.setCategory(category);
			// 출력
			if(!day.equals(fcstDate.toString())) {
				day=fcstDate.toString();
			}
			if(!time.equals(fcstTime.toString())) {
				time=fcstTime.toString();
				System.out.println(day+"  "+time);
			}
			log.info("테스트 wvo = {}", wvo);
			
        }
        
        

    }

    
}
