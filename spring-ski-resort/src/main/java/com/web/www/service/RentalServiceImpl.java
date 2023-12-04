package com.web.www.service;

import java.util.List;

import org.json.simple.ItemList;
import org.springframework.stereotype.Service;

import com.web.www.domain.FileVO;
import com.web.www.domain.rental.RentalItemDTO;
import com.web.www.domain.rental.RentalItemListDTO;
import com.web.www.domain.rental.RentalItemVO;
import com.web.www.domain.rental.RentalLiftVO;
import com.web.www.domain.rental.RentalVO;
import com.web.www.repository.FileDAO;
import com.web.www.repository.RentalDAO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class RentalServiceImpl implements RentalService{

	private final RentalDAO rdao;
	
	private final FileDAO fdao;

	@Override
	public int liftReserve(RentalLiftVO rlivo) {
		return rdao.liftReserve(rlivo);
	}

	@Override
	public int rental(RentalVO rvo) {
		
		return rdao.rental(rvo);
	}

//	@Override
//	public int itemRegister(RentalItemVO ritvo) {
//		
//		return rdao.itemRegister(ritvo);
//	}

	@Override
	public int itemRegister(RentalItemDTO rdto) {
		int isOk = rdao.itemRegister(rdto.getRitvo());
		
		if(rdto.getFlist() == null) {
			return isOk;
		}
		
		if(isOk > 0 && rdto.getFlist().size() > 0) {
			long rentalListItemNum = rdao.selectOneItemNum();
			for(FileVO fvo : rdto.getFlist()) {
				fvo.setRentalListItemNum(rentalListItemNum);
				isOk *= fdao.insertItemFile(fvo);
			}
		}
		
		return isOk;
	}

	@Override
	public List<RentalItemListDTO> itemList() {
		List<RentalItemVO> rlist =  rdao.ItemAndPicture();
		List<FileVO> flist = fdao.ItemAndPicture();
		return null;
	}





}
