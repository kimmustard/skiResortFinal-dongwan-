package com.web.www.service;

import java.util.List;

import com.web.www.domain.board.NoticeVO;

public interface NoticeService {

	int noticeRegister(NoticeVO nvo);

	NoticeVO noticeDetail(long noticeNum);

	List<NoticeVO> noticeList();

	int noticeModify(NoticeVO nvo);

}
