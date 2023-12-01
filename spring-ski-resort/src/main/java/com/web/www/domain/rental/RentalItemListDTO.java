package com.web.www.domain.rental;

import java.util.List;

import com.web.www.domain.FileVO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class RentalItemListDTO {
	private List<RentalItemVO> ritvo;
	private List<FileVO> flist;
}
