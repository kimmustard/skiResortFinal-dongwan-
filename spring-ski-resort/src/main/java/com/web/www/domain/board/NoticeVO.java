package com.web.www.domain.board;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class NoticeVO {
	
	private long noticeNum; //글번호
	private long memberNum; //회원번호
	private String noticeWriter; //작성자(운영자)
	private String noticeCategory; //카테고리(업데이트,작업,서비스,이벤트,공고 등)
	private String noticeTitle; //글제목
	private String noticeContent; //글내용
	private int noticeCount; //조회수
	private String noticeRegAt; //등록일
	private String noticeModAt; //수정일
	private String noticePoint; //중요공지 상단 노출

}



//create table notice(
//notice_num bigint not null auto_increment,
//member_num bigint not null,
//notice_writer varchar(50) not null,
//notice_category varchar(20) not null,
//notice_title varchar(100) not null,
//notice_content text,
//notice_count int default 0,
//notice_reg_at datetime default now(),
//notice_mod_at datetime default now(),
//notice_point varchar(1) default 'N',
//primary key(notice_num),
//foreign key(member_num) references member(member_num)
//);