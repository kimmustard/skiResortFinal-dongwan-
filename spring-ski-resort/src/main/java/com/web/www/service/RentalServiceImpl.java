package com.web.www.service;

import org.springframework.stereotype.Service;

import com.web.www.repository.RentalDAO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class RentalServiceImpl implements RentalService{

	private final RentalDAO rdao;
}
