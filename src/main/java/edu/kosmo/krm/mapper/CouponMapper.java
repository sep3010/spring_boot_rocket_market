package edu.kosmo.krm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import edu.kosmo.krm.vo.CouponVO;



@Mapper
public interface CouponMapper {
	
	// 쿠폰목록 ====================================================
	@Select("SELECT * FROM coupon")
	public List<CouponVO> getCouponList();
	// 쿠폰등록=====================================================
	@Insert("INSERT INTO coupon VALUES (coupon_SEQ.NEXTVAL ,#{name} ,#{discount})")
	public void insertCoupon(CouponVO couponVO);
	

}
