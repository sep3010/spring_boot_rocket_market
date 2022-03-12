package edu.kosmo.krm.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import edu.kosmo.krm.mapper.CouponMapper;
import edu.kosmo.krm.vo.CouponVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
@Service
public class CouponServiceImpl implements CouponService {
	
	@Autowired
	private CouponMapper couponMapper;
	
	//쿠폰목록====================================================
	@Override
	public List<CouponVO> getCouponList() {
		log.info("getCouponList..");
		return couponMapper.getCouponList();
	}

	//쿠폰등록====================================================
	public void insertCoupon(CouponVO couponVO) {
		log.info("insertCoupon..");
		couponMapper.insertCoupon(couponVO);
	}

	
}
