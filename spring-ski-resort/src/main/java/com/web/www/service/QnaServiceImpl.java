package com.web.www.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.www.domain.FileVO;
import com.web.www.domain.alarm.AlarmVO;
import com.web.www.domain.board.PagingVO;
import com.web.www.domain.board.QnaAnsDTO;
import com.web.www.domain.board.QnaDTO;
import com.web.www.domain.board.QnaVO;
import com.web.www.repository.AlarmDAO;
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
	private final AlarmDAO adao;
	
	
	
///// Q&A 등록 구간 //////
	@Transactional
	@Override
	public int qnaRegister(QnaDTO qdto) {
		//제목 공백 등록 막기
		if(qdto.getQvo().getQnaTitle().equals("")) {
			log.info(">>>>> register 제목 공백 발생>>>");
			return 2;
		}else {
			if(qdto.getQvo().getQnaSecret()==null) { //비밀글 미체크시 null값 대신 'N'
				qdto.getQvo().setQnaSecret("N");
			}
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
		
	}



	@Override
	public List<QnaVO> qnaList(PagingVO pgvo) {
		log.info(">>>>> qna List service >> ");
		return qdao.selectList(pgvo);
	}
	
	
	
	@Override
	public List<QnaVO> qnaListNoPaging() {
		log.info(">>>>> qna List service >> ");
		return qdao.selectListNoPaging();
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


	@Transactional
	@Override
	public int qnaFileModify(QnaDTO qdto) {
		log.info(">>>>> Qna file modify service >> ");
		//제목 공백 등록 막기
		if(qdto.getQvo().getQnaTitle().equals("")) {
			log.info(">>>>> register 제목 공백 발생>>>");
			return 2;
		}else {
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


	
	
	
	
///// Q&A 답변 등록 구간 //////	

	@Transactional
	@Override
	public int qnaAnsRegister(QnaAnsDTO qadto) {
		int isOk = qdao.ansInsert(qadto.getQavo());
		isOk = qdao.qnaIsokUpdate(qadto.getQavo().getQnaNum()); //qnaIsok='Y'만들기
		if(qadto.getFlist()==null) {
			isOk*=1;
			long memberNum = qdao.getQnaInfo(qadto.getQavo().getQnaNum());
			adao.alarmSetting(new AlarmVO(memberNum, 7, "문의"));
			return isOk;
		}
		if(isOk > 0 && qadto.getFlist().size() > 0) {
			long qnaAnsNum = qdao.selectOneQnaAnsNum(); //가장 마지막에 등록된 qna_ans_num
			long qnaNum = qadto.getQavo().getQnaNum(); 
			//모든 파일에 qnaNum, qnaAnsNum set
			for(FileVO fvo : qadto.getFlist()) {
				fvo.setQnaAnsNum(qnaAnsNum);
				fvo.setQnaNum(qnaNum);
				isOk*=fdao.insertQnaAnsFile(fvo);
			}
		}
		long memberNum = qdao.getQnaInfo(qadto.getQavo().getQnaNum());
		adao.alarmSetting(new AlarmVO(memberNum, 7, "문의"));
		return isOk;
	}



	@Override
	public QnaAnsDTO qnaAnsDetail(long qnaNum) {
		log.info(">>>>> qna ans detail service >> ");
		QnaAnsDTO qadto = new QnaAnsDTO(qdao.selectAnsDetail(qnaNum), fdao.getQnaAnsFileList(qnaNum));
		return qadto;
	}


	@Transactional
	@Override
	public int qnaAnsFileModify(QnaAnsDTO qadto) {
		log.info(">>>>> Qna-ans file modify service >> ");
		int isOk = qdao.QnaAnsFileModify(qadto.getQavo());
		isOk = qdao.qnaIsokUpdate(qadto.getQavo().getQnaNum()); //qnaIsok='Y'만들기
		if(qadto.getFlist()==null) {
			isOk*=1;
		}else {
			if(isOk > 0 && qadto.getFlist().size() > 0) {
				long qnaAnsNum = qdao.selectOneQnaAnsNum(); //가장 마지막에 등록된 qna_ans_num
				long qnaNum = qadto.getQavo().getQnaNum();
				for(FileVO fvo : qadto.getFlist()) {
					fvo.setQnaAnsNum(qnaAnsNum);
					fvo.setQnaNum(qnaNum);
					isOk *= fdao.insertQnaAnsFile(fvo);
				}
			}
		}
		return isOk;
	}






	
	

}
