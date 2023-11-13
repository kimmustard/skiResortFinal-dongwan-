package com.web.www.service;

import org.springframework.stereotype.Service;

import com.web.www.repository.DunmmyBoardDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class DummyBoardServiceImpl implements DummyBoardService{

	private final DunmmyBoardDAO dbdao;
}
