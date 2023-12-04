package com.web.www.service;

import java.util.List;

import com.web.www.domain.board.PagingVO;
import com.web.www.domain.board.QnaAnsDTO;
import com.web.www.domain.board.QnaVO;
import com.web.www.domain.board.QnaDTO;

public interface QnaService {

	int qnaRegister(QnaDTO qnaDTO);

	List<QnaVO> qnaList(PagingVO pgvo);

	int getTotalCount(PagingVO pgvo);

	QnaDTO qnaDetail(long qnaNum);

	int qnaFileModify(QnaDTO qdto);

	int qnaRemove(long qnaNum);

	int qnaRemoveFile(String uuid);
	
	
	//qns 답변라인

	int qnaAnsRegister(QnaAnsDTO qnaAnsDTO);

	QnaAnsDTO qnaAnsDetail(long qnaNum);

	int qnaAnsFileModify(QnaAnsDTO qadto);


}
