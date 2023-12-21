package com.web.www.domain.bus;

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
public class BusVO {
	private long busReserveNum; // 버스 예약번호
	private int busNum; // 차량번호
	private long memberNum; // 회원번호
	private String busRegion; // 출발지역
	private String busStartDate; // 출발날짜
	private int busPeople; // 탑승인원
	private String busIsok; // 버스 이용가능여부
	private String busCancel; // 버스 예약취소여부
	
}
