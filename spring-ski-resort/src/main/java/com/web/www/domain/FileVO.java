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
	
	private String fileUuid; //uuid
	private String fileSave; //경로 
	private String fileName; //파일이름
	private String fileIsok; //파일존재여부
	private int fileType; //파일타입확인(img)
	private long fileSize; //파일 사이즈
	private int fileAsc; //파일 등록 순서
	private String fileRegAt; //등록일
	private long noticeNum; //공지글번호
	private long qnaNum; //Q&A 글번호
	private long qnaAnsNum; //Q&A답변 글번호
	private long rentalListItemNum; //장비이미지 번호
	private String noticeImpactFile; //상단 슬라이드 공지 이미지 파일 여부 Y,N

	
	

	
	


}
