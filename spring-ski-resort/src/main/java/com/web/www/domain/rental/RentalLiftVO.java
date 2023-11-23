package com.web.www.domain.rental;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class RentalLiftVO {
	private String rentalLiftNum; // 리프트권 일련번호
	private long rentalMainNum; // 렌탈 예약번호
	private String rentalLiftTicket; // 리프트권 종류
	private int rentalLiftAdultFee; // 리프트권 성인요금
	private int rentalLiftKidFee; // 리프트권 어린이요금
}
