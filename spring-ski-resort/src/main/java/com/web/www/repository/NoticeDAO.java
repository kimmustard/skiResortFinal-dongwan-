package com.web.www.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.web.www.domain.board.PagingVO;
import com.web.www.domain.board.NoticeVO;

public interface NoticeDAO {

	int insert(NoticeVO nvo);

	NoticeVO selectDetail(long noticeNum);

	List<NoticeVO> selectList(PagingVO pgvo);

	int update(NoticeVO nvo);

	int delete(long noticeNum);

	int getTotalCount(PagingVO pgvo);

	void readCount(@Param("noticeNum")long noticeNum, @Param("cnt")int cnt);

	long selectOneNoticeNum();

	int noticeFileModify(NoticeVO nvo);

	List<NoticeVO> getTwoNotice();

	List<NoticeVO> selectPointList();

}
