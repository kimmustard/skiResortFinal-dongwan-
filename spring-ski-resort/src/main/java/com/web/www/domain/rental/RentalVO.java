package com.web.www.domain.rental;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class RentalVO {
	private long rentalMainNum; // 렌탈 예약번호(pk)
	private String rentalLiftNum; // 리프트권 일련번호(fk)
	private long rentalShopNum; // 업체번호
	private String memberEmail; // 회원이메일
	private String rentalMainIsreturn; // 반납 서비스 여부
	private String rentalMainLift; // 리프트권 구매 여부
	private String memberType; // 회원타입
}
