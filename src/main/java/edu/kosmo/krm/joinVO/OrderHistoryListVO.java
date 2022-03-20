/* 
== 주문 내역 목록을 뽑을 때 사용할 Join 테이블들 ==
        member,
        member_order,
        order_detail,
        delivery,
        product
*/

package edu.kosmo.krm.joinVO;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


/*
	 m.username,
     mo.id AS order_id,
     mo.amount,
     mo.order_date,
     mo.status,
     d.delivery_number,
     od.quantity,
     p.brand,
     p.name AS product_name
*/


@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class OrderHistoryListVO {

	
	// member
	private String username;
	
	// member_order
	private int order_id;
	private int amount;
	private Timestamp order_date;
	private String status;
	
	//delivery
	private String delivery_number;
	
	// order_detail
	private int quantity;

	// Product
	private String brand;
	private String product_name; // (기존: name)


}
