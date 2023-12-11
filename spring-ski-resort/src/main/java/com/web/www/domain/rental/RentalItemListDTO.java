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
public class RentalItemListDTO {
	
	private long rentalListItemNum; // 장비번호
	private String rentalListItemType; // 장비타입
	private String rentalListItemGrade; // 장비등급
	private String rentalListLowItem; // 일반장비
	private String rentalListMidItem; // 중급장비
	private String rentalListPremiumItem; // 프리미엄장비
	private int rentalListItemAdultFee; // 성인요금
	private int rentalListItemKidFee; // 어린이요금
	private int rentalListItemCount; // 장비수량
	
	private String fileName;
	private String imageUrl;
	
}
