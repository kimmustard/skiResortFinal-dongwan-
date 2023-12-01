package com.web.www.domain.hotel;

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
	private long hotelMainNum; 
	private int hotelRoomNum;
	private long memberNum;
	private String payMerchantUid;
	private String hotelReserveStayStart;
	private String hotelReserveStayEnd;
	private int hotelReserveFee;
	private int hotelReservePeople;
	private int hotelReserveChild;
	private String hotelReserveCarNum;

}

