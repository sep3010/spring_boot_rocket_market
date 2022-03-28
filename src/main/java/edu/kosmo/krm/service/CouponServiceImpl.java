package edu.kosmo.krm.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kosmo.krm.joinVO.JoinCoupon;
import edu.kosmo.krm.mapper.CouponMapper;
import edu.kosmo.krm.vo.CouponVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CouponServiceImpl implements CouponService {
	
	@Autowired
	private CouponMapper couponMapper;
	

	@Override
	public List<CouponVO> getCouponList() {
		log.info("getCouponList..");
		return couponMapper.getCouponList();
	}

	@Override
	public void insertCoupon(CouponVO couponVO) {
		log.info("insertCoupon..");
		couponMapper.insertCoupon(couponVO);
	}

	@Override
	public int getMemberCouponCount(int user_id) {
		log.info("getMemberCouponCount..");
		return couponMapper.getMemberCouponCount(user_id);
	}

	// 회원별 쿠폰리스트 가져오기
	@Override
	public List<JoinCoupon> getMemberCoupon(int member_id) {
		log.info("getMemberCoupon..");
		return couponMapper.getMemberCouponList(member_id);
	}
	
	

	
}
