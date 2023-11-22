package com.web.www.service;

import java.util.List;

import com.web.www.domain.board.PagingVO;
import com.web.www.domain.board.NoticeDTO;
import com.web.www.domain.board.NoticeVO;

public interface NoticeService {

	int noticeRegister(NoticeDTO noticeDTO);

	NoticeVO noticeDetail(long noticeNum);

	List<NoticeVO> noticeList(PagingVO npvo);

	int noticeModify(NoticeVO nvo);

	int remove(long noticeNum);

	int getTotalCount(PagingVO npvo);

}
