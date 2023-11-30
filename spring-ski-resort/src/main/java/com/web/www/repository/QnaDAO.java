package com.web.www.repository;

import java.util.List;

import com.web.www.domain.board.PagingVO;
import com.web.www.domain.board.QnaAnsVO;
import com.web.www.domain.board.QnaVO;

public interface QnaDAO {

	int insert(QnaVO qvo);

	long selectOneQnaNum();

	List<QnaVO> selectList(PagingVO pgvo);

	int getTotalCount(PagingVO pgvo);

	QnaVO selectDetail(long qnaNum);

	int QnaFileModify(QnaVO qvo);

	int delete(long qnaNum);
	
	
	//qns 답변 라인

	int ansInsert(QnaAnsVO qavo);

	long selectOneQnaAnsNum();

	QnaAnsVO selectAnsDetail(long qnaNum);

	int qnaIsokUpdate(long qnaNum); //qnaIsok = Y


}
