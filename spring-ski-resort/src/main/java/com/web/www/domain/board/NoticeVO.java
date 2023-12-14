package com.web.www.domain.board;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
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
	private String noticePoint; //중요공지 등록 여부
	private String noticeImpact; //상단 슬라이드 이미지 파일 등록 여부
	private String noticeDel; //삭제여부
	private String noticeImageUrl; //이미지url
	
	//초기 db에 넣기위한 생성자
	public NoticeVO(long memberNum, String noticeWriter, String noticeCategory, String noticeTitle,
			String noticeContent, String noticePoint, String noticeImageUrl) {
		super();
		this.memberNum = memberNum;
		this.noticeWriter = noticeWriter;
		this.noticeCategory = noticeCategory;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticePoint = noticePoint;
		this.noticeImageUrl = noticeImageUrl;
	}
	
	
}



