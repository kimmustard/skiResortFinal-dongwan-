package com.web.www.domain.board;

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
public class QnaAnsVO {
	
	private long qnaAnsNum; //답변 글번호
	private long qnaNum; //문의 글 번호
	private String qnaAnsWriter; //작성자
	private String qnaAnsTitle; //글제목
	private String qnaAnsContent; //내용
	private String qnaAnsDel; //삭제 여부
	private String qnaAnsRegAt; //글 작성일
	private String qnaAnsModAt; //글 수정일

}
