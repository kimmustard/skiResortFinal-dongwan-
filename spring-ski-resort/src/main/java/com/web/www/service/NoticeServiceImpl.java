package com.web.www.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.web.www.domain.board.PagingVO;
import com.web.www.domain.FileVO;
import com.web.www.domain.board.NoticeDTO;
import com.web.www.domain.board.NoticeVO;
import com.web.www.repository.FileDAO;
import com.web.www.repository.NoticeDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService{
	
	private final NoticeDAO ndao;
	
	private final FileDAO fdao;
	

//	@Override
//	public int noticeRegister(NoticeVO nvo) {
//		log.info(">>>>> notice register service >> ");
//		int isOk = ndao.insert(nvo);
//		return isOk;
//	}
	
	
	@Override
	public int noticeRegister(NoticeDTO ndto) {
		if(ndto.getNvo().getNoticePoint()==null) { //중요공지 미체크시 null값 대신 'N'
			ndto.getNvo().setNoticePoint("N");
		}
		if(ndto.getNvo().getNoticeImpact()==null) {
			ndto.getNvo().setNoticeImpact("N");
		}
		int isOk = ndao.insert(ndto.getNvo());
		if(ndto.getFlist()==null) {
			isOk*=1;
			return isOk;
		}
		if(isOk > 0 && ndto.getFlist().size() > 0) {
			long noticeNum = ndao.selectOneNoticeNum(); //가장 마지막에 등록된 notice_num
			//모든 파일에 bno set
			if(ndto.getNvo().getNoticeImpact().equals("Y")) { //상단 슬라이드 체크시 file 테이블에 noticeImpactFile에 "Y" 또는 "N"
				for(FileVO fvo : ndto.getFlist()) {
					fvo.setNoticeNum(noticeNum);
					fvo.setNoticeImpactFile("Y");
					isOk*=fdao.insertNoticeFile(fvo);
				}
			}
			if(ndto.getNvo().getNoticeImpact().equals("N") || ndto.getNvo().getNoticeImpact()==null){
				for(FileVO fvo : ndto.getFlist()) {
					fvo.setNoticeNum(noticeNum);
					fvo.setNoticeImpactFile("N");
					isOk*=fdao.insertNoticeFile(fvo);
				}				
			}
		}
		return isOk;
	}


//	@Override
//	public NoticeVO noticeDetail(long noticeNum) {
//		log.info(">>>>> notice detail service >> ");
//		ndao.readCount(noticeNum,1);
//		return ndao.selectDetail(noticeNum);
//	}
	
	@Override
	public NoticeDTO noticeDetail(long noticeNum) {
		log.info(">>>>> notice detail service >> ");
		ndao.readCount(noticeNum,1);
		NoticeDTO ndto = new NoticeDTO(ndao.selectDetail(noticeNum), fdao.getNoticeFileList(noticeNum));
		return ndto;
	}


//	@Override
//	public List<NoticeVO> noticeList() {
//		log.info(">>>>> notice List service >> ");
//		return ndao.selectList();
//	}
	
	
	@Override
	public List<NoticeVO> noticeList(PagingVO pgvo) {
		log.info(">>>>> notice List service >> ");
		return ndao.selectList(pgvo);
	}
	
	
	@Override
	public List<NoticeVO> noticeListNoPaging() {
		log.info(">>>>> notice List service >> ");
		return ndao.selectListNoPaging();
	}

	
	@Override
	public List<NoticeVO> noticePointList(PagingVO pgvo) {
		log.info(">>>>> notice point List service >> ");	
		return ndao.selectPointList(pgvo);
	}
	
	
	@Override
	public List<FileVO> noticeImpactFileList() {
		return fdao.selectFileImpactList();
	}

	
	@Override
	public int noticeModify(NoticeVO nvo) {
		log.info(">>>>> notice modify service >> ");
		ndao.readCount(nvo.getNoticeNum(), -2);
		int isOk = ndao.update(nvo);
		return isOk;
	}

	
	@Override
	public int noticeFileModify(NoticeDTO ndto) {
		log.info(">>>>> notice file modify service >> ");
		if(ndto.getNvo().getNoticePoint()==null) { //중요공지 미체크시 null값 대신 'N'
			ndto.getNvo().setNoticePoint("N");
		}
		ndao.readCount(ndto.getNvo().getNoticeNum(), -2);
		int isOk = ndao.noticeFileModify(ndto.getNvo());
		if(ndto.getFlist()==null) {
			isOk*=1;
		}else {
			if(isOk > 0 && ndto.getFlist().size() > 0) {
				long NoticeNum = ndto.getNvo().getNoticeNum();
				for(FileVO fvo : ndto.getFlist()) {
					fvo.setNoticeNum(NoticeNum);
					isOk *= fdao.insertNoticeFile(fvo);
				}
			}
		}
		return isOk;
	}

	@Override
	public int noticeRemove(long noticeNum) {
		log.info(">>>>> notice remove service >> ");
		fdao.deleteAllFileNotice(noticeNum);
		int isOk = ndao.delete(noticeNum);
		return isOk;
	}
	
	@Override
	public int noticeRemoveFile(String uuid) {
		log.info(">>>>> notice remove file service >> ");
		return fdao.noticeRemoveFile(uuid);
	}


	@Override
	public int getTotalCount(PagingVO pgvo) {
		log.info(">>>>> notice totalCount service >> ");
		return ndao.getTotalCount(pgvo);
	}


	@Override
	public List<NoticeVO> getTwoNotice() {
		// TODO Auto-generated method stub
		return ndao.getTwoNotice();
	}


	@Override
	public int selectEventCnt() {
		// TODO Auto-generated method stub
		return ndao.selectEventCnt();
	}


	@Override
	public void addEvent(NoticeVO noticeVO) {
		if(noticeVO.getNoticePoint()==null) { //중요공지 미체크시 null값 대신 'N'
			noticeVO.setNoticePoint("N");
		}else if(noticeVO.getNoticeImpact()==null) {
			noticeVO.setNoticeImpact("N");
		}
		ndao.addEvent(noticeVO);
		
	}


	@Override
	public List<NoticeVO> getFiveEvent() {
		// TODO Auto-generated method stub
		return ndao.getFiveEvent();
	}


	














	

}
