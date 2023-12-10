package com.web.www.service;

import com.web.www.domain.alarm.AlarmContentVO;

public interface AlarmService {

	/**
	 * 서버 시작후 alarm 시스템 초기 DB세팅입니다.
	 * @return
	 */
	int selectAlarmCnt();
	void addAlarmList(AlarmContentVO alarmContentVO);

}
