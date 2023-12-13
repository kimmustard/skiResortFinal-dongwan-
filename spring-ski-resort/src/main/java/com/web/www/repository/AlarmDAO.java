package com.web.www.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.web.www.domain.alarm.AlarmContentVO;
import com.web.www.domain.alarm.AlarmDTO;
import com.web.www.domain.alarm.AlarmReadDTO;
import com.web.www.domain.alarm.AlarmVO;
import com.web.www.domain.member.MemberCheckDTO;

public interface AlarmDAO {

	int selectAlarmCnt();

	void addAlarmList(AlarmContentVO alarmContentVO);

	void alarmSetting(AlarmVO alarmVO);

	List<AlarmDTO> getAlarmListTen(long memberNum);

	long getAlarmMemberNum(String memberId);

	int alarmReadCheck(AlarmReadDTO arDTO);

	List<AlarmDTO> getMemberAlarmList(long memberNum);

	void removeMemberAlarm(@Param("memberNum")long memberNum, @Param("alarmRegAt") String alarmRegAt);

	int masCheck(MemberCheckDTO mcDto);

}
