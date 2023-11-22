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
public class FileVO {
	
	private String uuid;
	private String saveDir;
	private String fileName;
	private String fileIsok;
	private int fileType;
	private long noticeNum;
	private long fileSize;
	private String regDate;
	
	
//			create table file(
//			uuid varchar(200) not null,
//			notice_num bigint,
//			save_dir varchar(200) not null,
//			file_name varchar(100) not null,
//			file_isok varchar(1) default 'N',
//			file_type tinyint(1) default 0,
//			file_size bigint,
//			file_reg_at datetime default now(),
//			primary key(uuid),
//			foreign key(notice_num) references notice(notice_num)
//			);
	
	

}
