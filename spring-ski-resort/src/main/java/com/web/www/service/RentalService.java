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

	RentalItemListDTO itemList();


}
