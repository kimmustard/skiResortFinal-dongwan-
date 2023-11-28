package com.web.www.repository;

import java.util.List;

import com.web.www.domain.board.PagingVO;
import com.web.www.domain.board.QnaVO;

public interface QnaDAO {

	int insert(QnaVO qvo);

	long selectOneQnaNum();

	List<QnaVO> selectList(PagingVO pgvo);

	int getTotalCount(PagingVO pgvo);

}
