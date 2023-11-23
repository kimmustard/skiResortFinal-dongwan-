package com.web.www.handler;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.tika.Tika;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.web.www.domain.FileVO;

import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnails;

@Slf4j
@Component
public class FileHandler {
	
	public List<FileVO> uploadFiles(MultipartFile[] files, String category){
		String UP_DIR="D:\\_myweb\\\\_java\\"+category;
		//D:\\_myweb\\_java\\notice\\202x\\월\일\\uuid_fileName.jpg
		//D:\\_myweb\\_java\\hotel\\202x\\월\일\\uuid_fileName.jpg
		//D:\\_myweb\\_java\\rental\\202x\\월\일\\uuid_fileName.jpg
		
		List<FileVO> flist = new ArrayList<>();
		LocalDate date = LocalDate.now();
		String today = date.toString();
		today = today.replace("-", File.separator);
		File folders = new File(UP_DIR, today);
		
		//폴더생성
		if(!folders.exists()) {
			folders.mkdirs();
		}
		
		for(MultipartFile file : files) {
			FileVO fvo = new FileVO();
			fvo.setSaveDir(today);
			fvo.setFileSize(file.getSize());
			fvo.setFileIsok("Y");
			
			String originalFileName = file.getOriginalFilename();
			log.info(">>>>> originalFileName >>> "+ originalFileName);
			String fileName = originalFileName.substring(originalFileName.lastIndexOf(File.separator)+1);
			log.info(">>>>> fileName >>> " + fileName);
			fvo.setFileName(fileName);
			
			UUID uuid = UUID.randomUUID();
			fvo.setUuid(uuid.toString());
			//-----기본 fileVO 생성 완료------
			
			//-----디스크에 저장할 파일 객체 생성-----
			String fullFileName = uuid.toString()+"_"+fileName;
			File storeFile = new File(folders, fullFileName);
			
			try {
				file.transferTo(storeFile);
				if(isImageFile(storeFile)) {
					fvo.setFileType(1);
					//썸네일 생성
					File thumbNail = new File(folders, uuid.toString()+"_th_"+fileName);
					Thumbnails.of(storeFile).size(75, 75).toFile(thumbNail);
				}
			} catch (Exception e) {
				log.info(">>>>> file 생성 오류 >>>");
				e.printStackTrace();
			}
			
			flist.add(fvo);
		}
		
		return flist;	
	}
	
	
	private boolean isImageFile(File storeFile) throws IOException {
		String mimeType = new Tika().detect(storeFile);
		return mimeType.startsWith("image")? true : false;
	}

}
