package com.web.www.domain;

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
	private String noticeContent; //글내용
	private int noticeCount; //조회수
	private String noticeRegAt; //등록일
	private String noticeModAt; //수정일

}
