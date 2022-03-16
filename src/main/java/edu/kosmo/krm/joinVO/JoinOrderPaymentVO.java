/*
 	주문/결제 페이지
 	    MEMBER M,
        USER_COUPON UC,
        MEMBER_ORDER MO,
        DELIVERY D,
        ORDER_DETAIL OD,
        PRODUCT P,
        PRODUCT_IMAGE PI
*/
package edu.kosmo.krm.joinVO;

import java.sql.Timestamp;
import java.util.List;

import edu.kosmo.krm.vo.CouponVO;
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
public class JoinOrderPaymentVO {

	
	private String member_name;
	private String phone;
	private String email;
	private int point;
	
	private int postcode;
	private String address;
	private String message;
	
	private int order_detail_id;
	private int quantity;
	
	private int amount;
	private int payment_number;
	
	private int product_id;
	private String brand;
	private String product_name;
	private int price;
	private int product_discount;
	private int userCoupon_id;
	private Timestamp issue_date;
	
	private List<ProductImageVO> productImages;
	private List<CouponVO> coupons;
	

}
