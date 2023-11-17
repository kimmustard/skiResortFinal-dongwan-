package com.web.www.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.web.www.domain.board.NoticeVO;
import com.web.www.repository.NoticeDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService{
	
	private final NoticeDAO ndao;
	

	@Override
	public int noticeRegister(NoticeVO nvo) {
		log.info(">>>>> notice register service >> ");
		int isOk = ndao.insert(nvo);
		return isOk;
	}


	@Override
	public NoticeVO noticeDetail(long noticeNum) {
		log.info(">>>>> notice detail service >> ");
		return ndao.selectDetail(noticeNum);
	}


	@Override
	public List<NoticeVO> noticeList() {
		log.info(">>>>> notice List service >> ");
		return ndao.selectList();
	}

}
