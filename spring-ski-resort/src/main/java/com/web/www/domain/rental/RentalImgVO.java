package com.web.www.domain.rental;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class RentalImgVO {
	private long rentalListItemNum; // 장비번호
	private String rentalFileSave; // 경로
	private String rentalFileName; // 파일이름
	private String rentalFileIsok; // 파일존재여부
	private String rentalFileSize; // 파일크기
	private String rentalFileRegAt; // 등록일
}
