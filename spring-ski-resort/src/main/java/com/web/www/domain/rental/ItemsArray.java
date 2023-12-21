package com.web.www.domain.rental;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ItemsArray {

	private long rentalReserveNum;
	
    private long rentalItemNum;
    private String rentalItemName;
    private int rentalItemPrice;
    private String rentalItemUrl;

}
