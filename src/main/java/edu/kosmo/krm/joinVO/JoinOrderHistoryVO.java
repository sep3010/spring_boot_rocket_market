/* 
== 주문 내역에서 사용할 Join 테이블들 ==
  	MEMBER,
    MEMBER_ORDER,
    DELIVERY,
    ORDER_DETAIL,
    PRODUCT,
    product_image
*/

package edu.kosmo.krm.joinVO;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

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
public class JoinOrderHistoryVO {

	
	// Member_Order Table
	private int order_id;
	private int amount;
	private Timestamp order_date;
	private String status;

	// Product
	private String product_name; // 컬럼 중복으로 이름 수정 (기존: name)
	private String brand;
	
	// Product_Image
	private int img_id; // 컬럼 중복으로 이름 수정 (기존: id)
	private int path;
	

}
