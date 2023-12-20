package com.web.www.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.web.www.domain.member.MemberVO;
import com.web.www.domain.rental.ItemsArray;
import com.web.www.domain.rental.RentalItemListDTO;
import com.web.www.domain.rental.RentalItemVO;
import com.web.www.domain.rental.RentalLiftVO;
import com.web.www.domain.rental.RentalReserveDTO;
import com.web.www.domain.rental.RentalReserveVO;
import com.web.www.domain.rental.RentalVO;
import com.web.www.domain.rental.rentalItemImageVO;

public interface RentalDAO {



	int rental(RentalVO rvo);

	int itemRegister(RentalItemVO ritvo);

	long selectOneItemNum();

	// 스키장비 등급(일반,중급,프리미엄)에 따라 분류
	List<RentalItemListDTO> getSkiLowItem();
	List<RentalItemListDTO> getSkiMidItem();
	List<RentalItemListDTO> getSkiPremiumItem();
	
	// 보드장비 등급(일반,중급,프리미엄)에 따라 분류
	List<RentalItemListDTO> getBoardLowItem();
	List<RentalItemListDTO> getBoardMidItem();
	List<RentalItemListDTO> getBoardPremiumItem();

	// 의류 등급(일반,중급,프리미엄)에 따라 분류
	List<RentalItemListDTO> getWearLowItem();
	List<RentalItemListDTO> getWearMidItem();
	List<RentalItemListDTO> getWearPremiumItem();

	void insertRentalItem(RentalItemVO ritvo);

	int rentalItemCntCheck();

	void insertRentalItemImage(rentalItemImageVO riivo);

	int rentalItemImageCntCheck();


	int itemReserve(RentalReserveVO rrvo);

	int updateRentalLift(RentalLiftVO rlivo);

	int rental(@Param("rentalLiftNum") String rentalLiftNum,@Param("mvo") MemberVO mvo);

	String getMemberPayMerchantUid(long memberNum);

	RentalLiftVO getMemberRentalLift(String payMerchantUid);

	
	//렌탈 장비 개수 체크
	int itemAmountCheck(String rentalItemNum);
	
	//결제 정보 저장 전 갯수 체킹

	
	
	// 결제 정보 저장
	void itemsPayInfoRegister(RentalReserveDTO rrDTO);
	long itemsPayInfoPrimaryKeyGet(String payMerchantUid);
	
	void itemsPayInfoListRegister(ItemsArray arr);











}
