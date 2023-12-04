package com.web.www.domain;

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
public class FileVO {
	
	private String uuid;
	private String saveDir;
	private String fileName;
	private String fileIsok;
	private int fileType;
	private long fileSize;
	private String regDate;
	private long noticeNum;
	private long qnaNum;
	private long rentalListItemNum;
	private long qnaAnsNum;
	
	

	
	

}
