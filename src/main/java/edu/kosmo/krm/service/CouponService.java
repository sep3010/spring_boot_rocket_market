package edu.kosmo.krm.service;


import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Service;

import edu.kosmo.krm.vo.CouponVO;

@Service
public interface CouponService {
	
	// 쿠폰목록 가져오기=========================================
	public List<CouponVO> getCouponList();
	// 쿠폰등록 ==============================================
	public void insertCoupon(CouponVO couponVO);

}
