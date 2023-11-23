package com.web.www.controller;

import java.io.IOException;

import org.json.simple.parser.ParseException;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.web.www.handler.WeatherHandler;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/weather/*")
@RequiredArgsConstructor
public class WeatherController {
	
	private final WeatherHandler wh;
	
	@GetMapping("/test")
	public String weatherCheck() throws IOException, ParseException {
		wh.weatherParser();
		return "index";
	}
	
}
