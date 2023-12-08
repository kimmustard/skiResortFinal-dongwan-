package com.web.www.service;

import java.util.List;

import com.web.www.domain.coupon.CouponCreate;
import com.web.www.domain.coupon.CouponSpread;
import com.web.www.domain.coupon.CouponSystem;
import com.web.www.domain.member.MemberVO;

public interface AdminService {

	List<MemberVO> getMemberList();

	int authUp(String memberId);

	int authDown(String memberId);

	List<CouponSystem> getCouponList();


	int couponCreate(CouponCreate cpc);

	int couponRemove(String couponCode);

	int spreadCoupon(String memberId, String couponCode);

	int allSpreadCoupon(CouponSpread cps);
}
