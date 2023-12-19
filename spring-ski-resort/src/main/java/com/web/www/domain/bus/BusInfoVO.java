package com.web.www.domain.bus;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class BusInfoVO {
	private int busNum;
	private String busRegion;
	private int busPeopleLimit;

}
