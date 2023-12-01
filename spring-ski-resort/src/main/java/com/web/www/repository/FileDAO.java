package com.web.www.repository;

import java.util.List;

import com.web.www.domain.FileVO;

public interface FileDAO {

	int insertNoticeFile(FileVO fvo);

	List<FileVO> getNoticeFileList(long noticeNum);

	int noticeRemoveFile(String uuid);

	int insertQnaFile(FileVO fvo);

	List<FileVO> getQnaFileList(long qnaNum);

	int qnaRemoveFile(String uuid);

	void deleteAllFileQna(long qnaNum);

	void deleteAllFileNotice(long noticeNum);

<<<<<<< HEAD
	int insertItemFile(FileVO fvo);

	List<FileVO> ItemAndPicture();
=======
	int insertQnaAnsFile(FileVO fvo);

	List<FileVO> getQnaAnsFileList(long qnaNum);
	

>>>>>>> 9b9878d1a001aa4b51b9731649d5b9d5135b3363

}
