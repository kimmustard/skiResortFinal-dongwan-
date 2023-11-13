package com.web.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.www.service.DummyBoardService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/dummy-board/*")
@RequiredArgsConstructor
public class DummyBoardController {
	
	private final DummyBoardService dbsv;
	
}
