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

	List<RentalItemListDTO> skiAllItem();





}
