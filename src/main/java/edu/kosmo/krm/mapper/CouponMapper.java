package edu.kosmo.krm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import edu.kosmo.krm.vo.CouponVO;



@Mapper
public interface CouponMapper {
	
	// 쿠폰목록 ====================================================
	@Select("select * from coupon")
	public List<CouponVO> getCouponList();

}
