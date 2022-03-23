package edu.kosmo.krm.vo;

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
MEMBER_ID                NUMBER        
DELIVERY_NUMBER          VARCHAR2(80)  
*/

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class DeliveryVO {
	
	private int delivery_id;
	private int order_id;
	private String postcode;
	private String address;
	private String receiver;
	private String phone;
	private String message;
	private int member_id;
	private String delivery_number;

}
