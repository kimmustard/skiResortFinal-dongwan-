package com.web.www.repository;

import java.util.List;

import com.web.www.domain.FileVO;

public interface FileDAO {

	int insertNoticeFile(FileVO fvo);

	List<FileVO> getNoticeFileList(long noticeNum);

	int noticeRemoveFile(String uuid);

}
