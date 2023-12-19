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

    private String rentalItemNum;
    private String rentalItemName;
    private String rentalItemPrice;
    private String rentalItemUrl;

}
