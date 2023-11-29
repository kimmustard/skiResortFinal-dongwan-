package com.web.www.domain.board;

import java.util.List;

import com.web.www.domain.FileVO;

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
public class QnaDTO {
	
	private QnaVO qvo;
	private List<FileVO> flist;

}
