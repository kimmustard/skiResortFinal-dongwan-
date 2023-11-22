package com.web.www.domain.board;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class NoticeFileVO {
	
	private String uuid;
	private String saveDir;
	private String fileName;
	private int fileType;
	private long noticeNum;
	private long fileSize;
	private String regDate;
	
	
	

}
