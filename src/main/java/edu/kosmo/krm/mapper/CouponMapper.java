package edu.kosmo.krm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import edu.kosmo.krm.vo.CouponVO;

@Mapper
public interface CouponMapper {

	@Select("SELECT \n"
			+ "id as coupon_id,\n"
			+ "name as coupon_name,\n"
			+ "discount as coupon_discount\n"
			+ "FROM coupon")
	public List<CouponVO> getCouponList();

	@Insert("INSERT INTO coupon VALUES (coupon_SEQ.NEXTVAL ,#{coupon_name} ,#{coupon_discount})")
	public void insertCoupon(CouponVO couponVO);
	
	@Select("SELECT COUNT(*) FROM coupon c, user_coupon uc WHERE c.id = uc.coupon_id AND uc.member_id = #{user_id} AND uc.use_check = 1")
	int getMemberCouponCount(int user_id);

}
