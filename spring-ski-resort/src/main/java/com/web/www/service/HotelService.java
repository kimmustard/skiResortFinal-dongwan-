package com.web.www.service;

import java.util.List;

import com.web.www.domain.hotel.RoomInfoVO;
import com.web.www.domain.hotel.RoomVO;

public interface HotelService {

	int updateRoomInfo(RoomInfoVO rivo);

	int addRoom(RoomVO rvo);

	List<RoomVO> getRoomList();

	int deleteRoom(int hotelRoomNum);

	int modifyRoom(RoomVO rvo);

	int selectRoomCnt();

}
