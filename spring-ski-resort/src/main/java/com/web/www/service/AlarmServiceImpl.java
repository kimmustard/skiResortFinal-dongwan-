package com.web.www.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.www.domain.alarm.AlarmContentVO;
import com.web.www.domain.alarm.AlarmDTO;
import com.web.www.domain.alarm.AlarmReadDTO;
import com.web.www.repository.AlarmDAO;
import com.web.www.repository.MemberDAO;

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

	@Transactional
	@Override
	public List<AlarmDTO> getAlarmListTen(long memberNum) {
		return adao.getAlarmListTen(memberNum);
	}

	@Override
	public int alarmReadCheck(AlarmReadDTO arDTO) {
		return adao.alarmReadCheck(arDTO);
	}

	
	@Override
	public List<AlarmDTO> getMemberAlarmList(long memberNum) {
		return adao.getMemberAlarmList(memberNum);
	}

	@Override
	public void removeMemberAlarm(long memberNum, String alarmRegAt) {
		adao.removeMemberAlarm(memberNum, alarmRegAt);
		
	}
	
	
}
