package com.web.www.service;

import org.springframework.stereotype.Service;

import com.web.www.domain.RoomInfoVO;
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

}
