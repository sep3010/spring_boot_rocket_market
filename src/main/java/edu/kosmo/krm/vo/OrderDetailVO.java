package edu.kosmo.krm.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
이름              널?       유형            
--------------- -------- ------------- 
ID              NOT NULL NUMBER(20)    
ORDER_ID                 NUMBER(30)    
POSTCODE        NOT NULL VARCHAR2(20)  
ADDRESS         NOT NULL VARCHAR2(300) 
RECEIVER        NOT NULL VARCHAR2(50)  
PHONE           NOT NULL VARCHAR2(50)  
MESSAGE                  VARCHAR2(50)  
MEMBER_ID                VARCHAR2(30)  
DELIVERY_NUMBER          VARCHAR2(80) 
*/

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class OrderDetailVO {
	
	private int order_detail_id;
	private long order_id;
	private int product_id;
	private int quantity;
	
	private List<ProductVO> products;

	
}
