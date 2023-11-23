package com.web.www.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.web.www.domain.Spot;
import com.web.www.handler.WeatherHandler;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/weather/*")
@RequiredArgsConstructor
public class WeatherController {

	private final WeatherHandler wh;
	
	@GetMapping("/serach")
	public List weatherTest(Spot spot){
		log.info("날씨 정보 테스트 체크!!!!");
		
		return null;
	}
}
