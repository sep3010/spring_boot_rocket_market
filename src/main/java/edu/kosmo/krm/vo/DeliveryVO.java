package edu.kosmo.krm.vo;

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
public class DeliveryVO {
	
	private int delivery_id; // 기존 : id
	private long order_id;
	private String postcode;
	private String address;
	private String receiver;
	private String phone;
	private String message;
	private String member_id; 
	private String delivery_number;



}
