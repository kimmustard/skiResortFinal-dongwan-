package com.web.www.domain.hotel;

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
public class RoomDetailImageVO {
	private int hotelRoomNum;
	private String hotelRoomImage1;
	private String hotelRoomImage2;
	private String hotelRoomImage3;
	private String hotelRoomImage4;
	
}
