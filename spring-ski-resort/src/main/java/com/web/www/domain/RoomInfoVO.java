package com.web.www.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class RoomInfoVO {
	private int hotelRoomNum;
	private String hotelReserveStayStart;
	private String hotelReserveStayEnd;
	private String hotelReserveIsok;
	private int hotelReserveFee;
	private int hotelReservePeople;
	private int hotelReserveChild;
	private String hotelReserveCarNum;
	private String hotelReserveStart;
	private String hotelReserveEnd;
}
