package com.web.www.domain.board;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NoticePagingVO {
	
	private int pageNo;
	private int qty;
	private String type; //검색용
	private String keyword;
	
	
	public NoticePagingVO() {
		this(1,10);
	}

	public NoticePagingVO(int pageNo, int qty) {
		this.pageNo = pageNo;
		this.qty = qty;
	}
	
	public int getPageStart() {
		return (this.pageNo-1) * qty;
	}
	
	public String[] getTypeToArray() {
		return this.type == null ? new String[] {} : this.type.split("");
	}
}
