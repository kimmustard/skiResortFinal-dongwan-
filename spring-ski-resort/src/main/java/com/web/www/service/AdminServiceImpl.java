package com.web.www.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.web.www.domain.coupon.CouponSystem;
import com.web.www.domain.member.MemberVO;
import com.web.www.repository.AdminDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService{

	private final AdminDAO adao;

	@Override
	public List<MemberVO> getMemberList() {
		return adao.getMemberList();
	}

	@Override
	public int authUp(String memberId) {
		int cnt = adao.getAuthCount(memberId);
		
		if(cnt == 1) {
			int isOk = adao.authUpManager(memberId);
			return isOk;
		}else if(cnt == 2) {
			int isOk = adao.authUpAdmin(memberId);
			return isOk;
		}else {
			return 0;
		}
	}

	@Override
	public int authDown(String memberId) {
		int cnt = adao.getAuthCount(memberId);
		if(cnt == 3) {
			int isOk = adao.authDownAdmin(memberId);
			return isOk;
		}else if(cnt == 2) {
			int isOk = adao.authDownManager(memberId);
			return isOk;
		}else {
			return 0;
		}
	}

	@Override
	public List<CouponSystem> getCouponList() {
		return adao.getCouponList();
	}
}
