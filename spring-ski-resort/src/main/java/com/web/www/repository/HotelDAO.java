package com.web.www.repository;

import java.util.List;

import com.web.www.domain.hotel.RoomInfoVO;
import com.web.www.domain.hotel.RoomVO;

public interface HotelDAO {

	int updateRoomInfo(RoomInfoVO rivo);

	int addRoom(RoomVO rvo);

	List<RoomVO> getRoomList();

	int deleteRoom(int hotelRoomNum);

	int modifyRoom(RoomVO rvo);

}
