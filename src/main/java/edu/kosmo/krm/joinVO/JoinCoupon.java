/* 
f== 쿠폰에서 사용하는 Join 테이블들 ==
		COUPON
		USER_COUPON
		MEMBER
*/

package edu.kosmo.krm.joinVO;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import edu.kosmo.krm.vo.ProductImageVO;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;



@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class JoinCoupon {

	private int coupon_id;
	private String coupon_name;
	private int discount;
	private Timestamp issue_date;
	private int member_id;

}
