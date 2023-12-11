package com.web.www.domain.alarm;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class AlarmDTO {

	private long memberNum;
	private long alarmContentNum;
	private String alarmCheck;
	private String alarmType;
	private String alarmRegAt;
	private String alarmContentName;
	private String alarmContentText;
	private String alarmContentUrl;
	
	
}
