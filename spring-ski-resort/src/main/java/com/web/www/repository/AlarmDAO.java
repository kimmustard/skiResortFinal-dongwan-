package com.web.www.repository;

import java.util.List;

import com.web.www.domain.alarm.AlarmContentVO;
import com.web.www.domain.alarm.AlarmDTO;
import com.web.www.domain.alarm.AlarmVO;

public interface AlarmDAO {

	int selectAlarmCnt();

	void addAlarmList(AlarmContentVO alarmContentVO);

	void alarmSetting(AlarmVO alarmVO);

	List<AlarmDTO> getAlarmListTen(long memberNum);

	long getAlarmMemberNum(String memberId);

}
