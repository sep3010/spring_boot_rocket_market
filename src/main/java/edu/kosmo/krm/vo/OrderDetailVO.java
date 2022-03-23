package edu.kosmo.krm.vo;

import java.sql.Timestamp;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
이름         널?       유형         
---------- -------- ---------- 
ID         NOT NULL NUMBER(30) 
ORDER_ID            NUMBER(30) 
PRODUCT_ID          NUMBER(20) 
QUANTITY            NUMBER(10)
*/

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class OrderDetailVO {

	//private int id; // 주문 상세 번호
	private int order_detail_id;
	private long order_id;
	private int product_id;
	private int quantity;
	
	private List<ProductVO> products;


}
