package com.web.www.domain.rental;

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
	private RentalItemVO ritvo;
	private FileVO fvo;
}
