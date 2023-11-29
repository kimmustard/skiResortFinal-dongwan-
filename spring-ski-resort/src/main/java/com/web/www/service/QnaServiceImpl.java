package com.web.www.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.web.www.domain.FileVO;
import com.web.www.domain.board.PagingVO;
import com.web.www.domain.board.QnaVO;
import com.web.www.domain.board.QnaDTO;
import com.web.www.repository.FileDAO;
import com.web.www.repository.QnaDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class QnaServiceImpl implements QnaService{
	
	private final QnaDAO qdao;
	private final FileDAO fdao;
	
	
	
	@Override
	public int qnaRegister(QnaDTO qdto) {
		int isOk = qdao.insert(qdto.getQvo());
		if(qdto.getFlist()==null) {
			isOk*=1;
			return isOk;
		}
		if(isOk > 0 && qdto.getFlist().size() > 0) {
			long qnaNum = qdao.selectOneQnaNum(); //가장 마지막에 등록된 qna_num
			//모든 파일에 qnaNum set
			for(FileVO fvo : qdto.getFlist()) {
				fvo.setQnaNum(qnaNum);
				isOk*=fdao.insertQnaFile(fvo);
			}
		}
		return isOk;
	}



	@Override
	public List<QnaVO> qnaList(PagingVO pgvo) {
		log.info(">>>>> qna List service >> ");
		return qdao.selectList(pgvo);
	}



	@Override
	public int getTotalCount(PagingVO pgvo) {
		log.info(">>>>> qna totalCount service >> ");
		return qdao.getTotalCount(pgvo);
	}



	@Override
	public QnaDTO qnaDetail(long qnaNum) {
		log.info(">>>>> qna detail service >> ");
		QnaDTO qdto = new QnaDTO(qdao.selectDetail(qnaNum), fdao.getQnaFileList(qnaNum));
		return qdto;
	}



	@Override
	public int qnaFileModify(QnaDTO qdto) {
		log.info(">>>>> Qna file modify service >> ");
		int isOk = qdao.QnaFileModify(qdto.getQvo());
		if(qdto.getFlist()==null) {
			isOk*=1;
		}else {
			if(isOk > 0 && qdto.getFlist().size() > 0) {
				long QnaNum = qdto.getQvo().getQnaNum();
				for(FileVO fvo : qdto.getFlist()) {
					fvo.setQnaNum(QnaNum);
					isOk *= fdao.insertQnaFile(fvo);
				}
			}
		}
		return isOk;
	}

	
	
	@Override
	public int qnaAnsRegister(QnaDTO qdto) {
		log.info(">>>>> Qna ans register service >> ");
		int isOk = qdao.insert(qdto.getQvo());
		if(qdto.getFlist()==null) {
			isOk*=1;
			return isOk;
		}
		if(isOk > 0 && qdto.getFlist().size() > 0) {
			long qnaNum = qdao.selectOneQnaNum(); //가장 마지막에 등록된 qna_num
			//모든 파일에 qnaNum set
			for(FileVO fvo : qdto.getFlist()) {
				fvo.setQnaNum(qnaNum);
				isOk*=fdao.insertQnaFile(fvo);
			}
		}
		return isOk;
	}


	
	
	@Override
	public int qnaRemove(long qnaNum) {
		log.info(">>>>> qna remove service >> ");
		int isOk = qdao.delete(qnaNum);
		fdao.deleteAllFileQna(qnaNum);
		return isOk;
	}



	@Override
	public int qnaRemoveFile(String uuid) {
		log.info(">>>>> qna remove file service >> ");
		return fdao.qnaRemoveFile(uuid);
	}




}
