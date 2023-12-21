package com.web.www.handler;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.retry.annotation.Backoff;
import org.springframework.retry.annotation.Retryable;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.web.www.repository.ProductRenewalDAO;
import com.web.www.repository.RentalDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class ProductRenewalSweeper {

	@Autowired
	private ProductRenewalDAO prdao;
	
	@Autowired
	private RentalDAO rdao;
	
	/** 
	 * @Scheduled 다이스키 리조트 모든 상품을 관리합니다.
	 * -  숙박종료일 / 렌탈대여 종료일 / 리프트 종료일시 / 쿠폰만료일 / 버스신청일 DB 변경을 합니다.
	 * -  호텔은 room_info 삭제, 결제 '기간만료' 변경
	 * -  리프트는 결제타입 '기간만료' 변경
	 * -  렌탈장비는 rental_reserve 반납여부 'Y' , 결제타입 '기간만료' 변경 , 장비개수 갱신
	 */
	@Async("productRenewalInit")
	@Retryable(
			value = RuntimeException.class,
			maxAttempts = 2,
			backoff = @Backoff(2000)
			)
	@Scheduled(cron = "0 0 0/24 * * *")
	public void productRenewal() {
		log.info("product 스케줄러 체크합니다");
		
		//갱신 대상 모든 payMerchantUid 스캔
		List<String> uidList = new ArrayList<>();
		uidList.addAll(prdao.hotelRenewalScan());
		uidList.addAll(prdao.liftRenewalScan());
		uidList.addAll(prdao.rentalRenewalScan());
		
		//만료된 객실 인포 삭제
		prdao.hotelRenewal();
		
		//쿠폰 갱신
		prdao.couponRenewal();
		
		//버스 좌석 갱신
		List<String> busList = prdao.busNumList();
		prdao.busRenewal();
		for (String busNum : busList) {
			prdao.busPeopleRenewal(busNum);
		}
		
		//알람 테이블 청소
		prdao.alarmRenewal();
		
		//결제 테이블 한번에 정리
		for (String payMerchantUid : uidList) {
			
			//렌탈 개수 갱신과 반납체크까지
			long rentalReserveNum = rdao.itemsPayInfoPrimaryKeyGet(payMerchantUid);
			List<Long> rentalItemNumList = rdao.getRentalItemNumList(rentalReserveNum);
			for (Long itemListNum : rentalItemNumList) {
				rdao.rentalItemListPlus(itemListNum);
			}
			rdao.itemPayInfoReturnCheck(payMerchantUid);
			
			
			prdao.PayRenuwal(payMerchantUid);
		}


	}
}
