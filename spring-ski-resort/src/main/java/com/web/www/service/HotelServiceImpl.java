
package com.web.www.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.web.www.domain.hotel.RoomInfoVO;
import com.web.www.domain.hotel.RoomVO;
import com.web.www.repository.HotelDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class HotelServiceImpl implements HotelService{

	private final HotelDAO hdao;

	@Override
	public int updateRoomInfo(RoomInfoVO rivo) {
		// TODO Auto-generated method stub
		return hdao.updateRoomInfo(rivo);
	}

	@Override
	public int addRoom(RoomVO rvo) {
		// TODO Auto-generated method stub
		return hdao.addRoom(rvo);
	}

	@Override
	public List<RoomVO> getRoomList() {
		// TODO Auto-generated method stub
		return hdao.getRoomList();
	}

	@Override
	public int deleteRoom(int hotelRoomNum) {
		// TODO Auto-generated method stub
		return hdao.deleteRoom(hotelRoomNum);
	}

	@Override
	public int modifyRoom(RoomVO rvo) {
		// TODO Auto-generated method stub
		return hdao.modifyRoom(rvo);
	}

}
