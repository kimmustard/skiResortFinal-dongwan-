package com.web.www.domain.rental;

import java.util.UUID;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor

public class RentalLiftVO {
	private String rentalLiftNum; // 리프트권 일련번호(pk)
	private String rentalLiftTicket; // 리프트권 종류
	private int rentalLiftAdultFee; // 리프트권 성인요금
	private int rentalLiftKidFee; // 리프트권 어린이요금
	private int rentalLiftAdult; // 인원수(성인)
	private int rentalLiftKid; // 인원수(어린이)
	private String rentalLiftStart; // 시작일
	
	public RentalLiftVO() {
		this.rentalLiftNum = UUID.randomUUID().toString();
	}
}
