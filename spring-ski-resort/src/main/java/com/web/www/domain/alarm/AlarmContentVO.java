package com.web.www.domain.alarm;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class AlarmContentVO {
	
	private long alarmContentNum;
	private String alarmContentName;
	private String alarmContentText;
	private String alarmContentUrl;
	
}
