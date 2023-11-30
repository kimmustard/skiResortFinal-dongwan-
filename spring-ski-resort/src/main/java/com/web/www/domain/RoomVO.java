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
public class RoomVO {
	private int hotelRoomNum ;
	private String hotelRoomExplain;
	private String hotelRoomType; 
	private String hotelReserveIsok;
}
