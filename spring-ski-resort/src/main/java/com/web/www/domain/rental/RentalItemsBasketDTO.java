package com.web.www.domain.rental;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class RentalItemsBasketDTO {

	private long rentalItemNum;
	private String rentalItemName;
	private int rentalItemPrice;
}
