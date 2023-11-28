package com.web.www.service;

import java.util.List;

import com.web.www.domain.board.PagingVO;
import com.web.www.domain.board.QnaVO;
import com.web.www.domain.board.qnaDTO;

public interface QnaService {

	int qnaRegister(qnaDTO qnaDTO);

	List<QnaVO> qnaList(PagingVO pgvo);

	int getTotalCount(PagingVO pgvo);

}
