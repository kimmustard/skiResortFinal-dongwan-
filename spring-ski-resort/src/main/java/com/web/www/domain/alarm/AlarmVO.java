package com.web.www.domain.alarm;

import lombok.Getter;

@Getter
public class AlarmVO {
	
	private long memberNum;
	private long alarmContentNum;
	private String alarmType;
	
	
	public AlarmVO() {
		
	}


	public AlarmVO(long memberNum, long alarmContentNum, String alarmType) {
		this.memberNum = memberNum;
		this.alarmContentNum = alarmContentNum;
		this.alarmType = alarmType;
	}

	
	
	
	
}
