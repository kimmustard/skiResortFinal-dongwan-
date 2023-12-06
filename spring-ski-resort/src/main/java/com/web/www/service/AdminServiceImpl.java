package com.web.www.service;

import org.springframework.stereotype.Service;

import com.web.www.repository.AdminDAO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService{

	private final AdminDAO adao;
}
