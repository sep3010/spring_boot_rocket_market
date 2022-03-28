package edu.kosmo.krm.service;


import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Service;

import edu.kosmo.krm.joinVO.JoinCoupon;
import edu.kosmo.krm.vo.CouponVO;

public interface CouponService {
	
	// 쿠폰목록 가져오기=========================================
	public List<CouponVO> getCouponList();
	
	// 쿠폰등록 ==============================================
	public void insertCoupon(CouponVO couponVO);
	
	// 유저가 소유한 쿠폰 갯수
	int getMemberCouponCount(int user_id);
	
	// 회원별 쿠폰리스트 가져오기
	public List<JoinCoupon> getMemberCoupon(int member_id);

}
