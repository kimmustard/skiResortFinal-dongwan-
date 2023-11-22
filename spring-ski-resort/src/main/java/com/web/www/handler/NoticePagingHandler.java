package com.web.www.handler;

import com.web.www.domain.board.NoticePagingVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NoticePagingHandler {
	
	private int startPage;
	private int endPage;
	private int realEndPage;
	private boolean prev, next; //이전, 다음 존재여부
	private int totalCount; //총 글자수
	private NoticePagingVO npvo;
	
	
	public NoticePagingHandler(NoticePagingVO npvo, int totalCount) {
		
		this.npvo = npvo;
		this.totalCount = totalCount;
		
		this.endPage = (int)Math.ceil(npvo.getPageNo() / (double)npvo.getQty()) * npvo.getQty();
		this.startPage = endPage - 9;
		
		this.realEndPage = (int)Math.ceil(totalCount / (double)npvo.getQty());
		if(realEndPage < endPage) {
			this.endPage = realEndPage;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEndPage;
	}
}
