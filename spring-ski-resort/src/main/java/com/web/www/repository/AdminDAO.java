package com.web.www.repository;

import java.util.List;

import com.web.www.domain.coupon.CouponCreate;
import com.web.www.domain.coupon.CouponSpread;
import com.web.www.domain.coupon.CouponSystem;
import com.web.www.domain.member.MemberVO;
import com.web.www.security.AuthVO;

public interface AdminDAO {

	List<MemberVO> getMemberList();

	List<AuthVO> selectAuths(String memberId);

	int getAuthCount(String memberId);

	int authUpManager(String memberId);
	int authUpAdmin(String memberId);

	int authDownAdmin(String memberId);
	int authDownManager(String memberId);

	List<CouponSystem> getCouponList();
	
	int couponCreateCheck(CouponCreate cpc);

	int couponCreate(CouponCreate cpc);

	int couponRemove(String couponCode);

	long spreadCouponMemberGet(String memberId);

	List<Long> noSpreadCouponMemberGet(CouponSpread cps);
	List<Long> allSpreadCouponMemberGet(CouponSpread cps);

	void allSpreadCoupon(CouponSpread cps);



}
