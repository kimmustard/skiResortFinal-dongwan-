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
public class RentalReserveVO {

	private String rentalLiftNum; // 리프트권 일련번호
	private long rentalListItemNum; // 장비번호
	private String rentalReserveStart; // 렌탈 시작일
	private int rentalReserveAdult; // 인원수(성인)
	private int rentalReserveKid; // 인원수(어린이)
	private String rentalReserveItem; // 렌탈장비명
	private int rentalReserveAdultFee; // 성인 요금
	private int rentalReserveKidFee; // 어린이 요금
	private int rentalReserveTotalFee; // 총 요금
	private String rentalReserveIsok; // 이용가능여부
	private String rentalReserveIsreturn; // 반납서비스신청여부
	private String rentalReserveRegAt; // 렌탈 예약신청일
}
