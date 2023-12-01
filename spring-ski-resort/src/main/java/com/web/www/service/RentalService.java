package com.web.www.service;

import com.web.www.domain.rental.RentalLiftVO;
import com.web.www.domain.rental.RentalVO;

public interface RentalService {

	int liftReserve(RentalLiftVO rlivo);

	int rental(RentalVO rvo);


}
