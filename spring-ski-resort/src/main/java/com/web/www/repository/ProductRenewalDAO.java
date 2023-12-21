package com.web.www.repository;

import java.util.Collection;
import java.util.List;

public interface ProductRenewalDAO {

	
	/**
	 * 호텔 리뉴얼
	 * @return
	 */
	List<String> hotelRenewalScan();
	void hotelRenewal();
	
	/**
	 * 리프트 리뉴얼
	 * @return
	 */
	List<String> liftRenewalScan();
	
	/**
	 * 렌탈 리뉴얼
	 * @return
	 */
	List<String> rentalRenewalScan();
	void rentalRenewal(String payMerchantUid);
	
	/**
	 * 쿠폰 리뉴얼
	 */
	void couponRenewal();

	/**
	 * 알람 리뉴얼
	 */
	void alarmRenewal();
	
	/**
	 * 버스 리뉴얼
	 */
	List<String> busNumList();
	void busRenewal();
	void busPeopleRenewal(String busNum);
	
	// 공용
	void PayRenuwal(String payMerchantUid);
	
}
