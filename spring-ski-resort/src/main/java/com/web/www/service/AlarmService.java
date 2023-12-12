package com.web.www.service;

import java.util.List;

import com.web.www.domain.alarm.AlarmContentVO;
import com.web.www.domain.alarm.AlarmDTO;
import com.web.www.domain.alarm.AlarmReadDTO;

public interface AlarmService {

	/**
	 * 서버 시작후 alarm 시스템 초기 DB세팅입니다.
	 * @return
	 */
	int selectAlarmCnt();
	void addAlarmList(AlarmContentVO alarmContentVO);
	
	//알람 리스트 불러오기
	List<AlarmDTO> getAlarmListTen(long memberNum);
	
	//읽음 체크
	int alarmReadCheck(AlarmReadDTO arDTO);

}
