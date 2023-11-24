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
public class RentalItemVO {
	private long rentalListItemNum; // 장비번호
	private String rentalListLowItem; // 일반장비
	private String rentalListMidItem; // 중급장비
	private String rentalListPremiumItem; // 프리미엄장비
	private int rentalListAdultFee; // 장비 성인요금
	private int rentalListKidFee; // 장비 어린이요금
}
