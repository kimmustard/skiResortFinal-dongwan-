package com.web.www.service;

import java.util.List;

import com.web.www.domain.rental.RentalItemDTO;
import com.web.www.domain.rental.RentalItemListDTO;
import com.web.www.domain.rental.RentalLiftVO;
import com.web.www.domain.rental.RentalVO;

public interface RentalService {

	int liftReserve(RentalLiftVO rlivo);

	int rental(RentalVO rvo);

	int itemRegister(RentalItemDTO rentalItemDTO);

	/**
	 * 스키장비 등급(일반,중급,프리미엄)에 따라 분류
	 * @return
	 */
	List<RentalItemListDTO> getSkiLowItem();
	List<RentalItemListDTO> getSkiMidItem();
	List<RentalItemListDTO> getSkiPremiumItem();



}
