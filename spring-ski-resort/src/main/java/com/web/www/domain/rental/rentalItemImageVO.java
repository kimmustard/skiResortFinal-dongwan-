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
public class rentalItemImageVO {
	private long rentalListItemNum; // 장비번호
	private String fileName; // 파일이름
	private String imageUrl; // 이미지 url

}
