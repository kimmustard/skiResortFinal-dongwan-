package com.web.www.repository;

import com.web.www.domain.rental.RentalLiftVO;
import com.web.www.domain.rental.RentalVO;

public interface RentalDAO {

	int liftReserve(RentalLiftVO rlivo);

	int rental(RentalVO rvo);

}
