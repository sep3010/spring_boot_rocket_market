package edu.kosmo.krm.vo;

import java.sql.Timestamp;

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
	private int id; // 주문 상세 번호
	private Long order_id; // 주문 번호
	private int product_id;
	private int quantity; // 수량
}
