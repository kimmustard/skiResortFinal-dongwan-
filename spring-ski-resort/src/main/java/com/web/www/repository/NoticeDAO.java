package com.web.www.repository;

import java.util.List;

import com.web.www.domain.board.NoticeVO;

public interface NoticeDAO {

	int insert(NoticeVO nvo);

	NoticeVO selectDetail(long noticeNum);

	List<NoticeVO> selectList();

}
