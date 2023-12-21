package com.web.www.repository;

import java.util.List;
import java.util.Map;

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
	int itemAmountCheck(long rentalItemNum);
	
	// 결제 정보 저장
	void itemsPayInfoRegister(RentalReserveDTO rrDTO);
	long itemsPayInfoPrimaryKeyGet(String payMerchantUid);
	
	void itemsPayInfoListRegister(ItemsArray arr);

	//구매시 렌탈아이템 개수 구하는 로직에 사용될 코드입니다.
	Map<Long, Object> getRentaiItemAmount(Long rentalItemNum);
	
	// 결제정보 저장 토대로 갯수 합산
	List<Long> getRentalItemNumList(long rentalReserveNum);

	// 수량 빼기
	void rentalItemListMinus(Long itemListNum);
	// 수량 채우기
	void rentalItemListPlus(Long itemListNum);
	// 환불 이후 반납 리턴 체크
	void itemPayInfoReturnCheck(String payMerchantUid);

	
	//영수증에 들어갈 아이템 목록
	List<String> getRentalItemList(String rentalReserveNum);

	












}
