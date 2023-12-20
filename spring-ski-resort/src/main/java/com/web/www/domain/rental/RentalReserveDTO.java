package com.web.www.domain.rental;

import java.util.List;


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
public class RentalReserveDTO {

	private String rentalReserveNum;
	private String rentalReserveStart;
	private String rentalReserveTotalFee;
	private String rentalReserveReturn;
	private String rentalReserveType;
	private String memberNum;
	private String payMerchantUid;
	
	//결제후 사용할 렌탈장비 상세리스트
	private List<String> itemsArray;
}
