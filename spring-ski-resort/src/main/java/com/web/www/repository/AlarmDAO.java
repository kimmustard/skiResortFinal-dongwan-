package com.web.www.repository;

import com.web.www.domain.alarm.AlarmContentVO;
import com.web.www.domain.alarm.AlarmVO;

public interface AlarmDAO {

	int selectAlarmCnt();

	void addAlarmList(AlarmContentVO alarmContentVO);

	void alarmSetting(AlarmVO alarmVO);

}
