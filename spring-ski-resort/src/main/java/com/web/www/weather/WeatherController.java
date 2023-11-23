package com.web.www.weather;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.www.repository.WeatherDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/weather/*")
@RequiredArgsConstructor
public class WeatherController {

	private final WeatherDAO wdao;
	
	
}
