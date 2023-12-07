package com.web.www.repository;

import java.util.List;

import com.web.www.domain.rental.RentalItemListDTO;
import com.web.www.domain.rental.RentalItemVO;
import com.web.www.domain.rental.RentalLiftVO;
import com.web.www.domain.rental.RentalVO;

public interface RentalDAO {

	int liftReserve(RentalLiftVO rlivo);

	int rental(RentalVO rvo);

	int itemRegister(RentalItemVO ritvo);

	long selectOneItemNum();

	// 스키장비 등급(일반,중급,프리미엄)에 따라 분류
	List<RentalItemListDTO> getSkiLowItem();
	List<RentalItemListDTO> getSkiMidItem();
	List<RentalItemListDTO> getSkiPremiumItem();
	
	// 보드장비 등급(일반,중급,프리미엄)에 따라 분류
	List<RentalItemListDTO> getBoardLowItem();
	List<RentalItemListDTO> getBoardMidItem();
	List<RentalItemListDTO> getBoardPremiumItem();

	// 의류 등급(일반,중급,프리미엄)에 따라 분류
	List<RentalItemListDTO> getWearLowItem();
	List<RentalItemListDTO> getWearMidItem();
	List<RentalItemListDTO> getWearPremiumItem();

	void insertRentalItem(RentalItemVO ritvo);

	int rentalItemCntCheck();






}
