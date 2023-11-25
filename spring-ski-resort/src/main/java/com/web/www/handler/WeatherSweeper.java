package com.web.www.handler;

import org.springframework.stereotype.Component;

import com.web.www.repository.WeatherDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
@RequiredArgsConstructor
public class WeatherSweeper {

	private final WeatherDAO wdao;
	
	public void WeatherApiRenewal() {
		
	}
	
}
