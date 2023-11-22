package com.web.www.service;

import java.util.List;

import com.web.www.domain.board.NoticePagingVO;
import com.web.www.domain.board.NoticeVO;

public interface NoticeService {

	int noticeRegister(NoticeVO nvo);

	NoticeVO noticeDetail(long noticeNum);

	List<NoticeVO> noticeList(NoticePagingVO npvo);

	int noticeModify(NoticeVO nvo);

	int remove(long noticeNum);

	int getTotalCount(NoticePagingVO npvo);

}
