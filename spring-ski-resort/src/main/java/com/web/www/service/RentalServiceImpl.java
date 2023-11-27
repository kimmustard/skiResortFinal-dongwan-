package com.web.www.service;

import org.springframework.stereotype.Service;

import com.web.www.domain.rental.RentalLiftVO;
import com.web.www.domain.rental.RentalVO;
import com.web.www.repository.RentalDAO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class RentalServiceImpl implements RentalService{

	private final RentalDAO rdao;

	@Override
	public int liftReserve(RentalLiftVO rlivo) {
		RentalVO rvo = new RentalVO();
		rdao.rental(rvo);
		return rdao.liftReserve(rlivo);
	}

}
