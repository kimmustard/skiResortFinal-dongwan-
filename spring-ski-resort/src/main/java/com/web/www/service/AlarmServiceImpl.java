package com.web.www.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.web.www.domain.alarm.AlarmContentVO;
import com.web.www.domain.alarm.AlarmDTO;
import com.web.www.repository.AlarmDAO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AlarmServiceImpl implements AlarmService{


	private final AlarmDAO adao;

	@Override
	public int selectAlarmCnt() {
		return adao.selectAlarmCnt();
	}

	@Override
	public void addAlarmList(AlarmContentVO alarmContentVO) {
		adao.addAlarmList(alarmContentVO);
	}

	@Override
	public List<AlarmDTO> getAlarmListTen(long memberNum) {
		return adao.getAlarmListTen(memberNum);
	}
	
	
}
