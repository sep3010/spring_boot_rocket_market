package edu.kosmo.krm.vo;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
이름             널?       유형            
-------------- -------- ------------- 
ID             NOT NULL NUMBER(30)    
MEMBER_ID               NUMBER(30)    
PAYMENT_NUMBER          VARCHAR2(100) 
AMOUNT                  NUMBER(20)    
ORDER_DATE              DATE          
STATUS                  VARCHAR2(30) 
*/

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class MemberOrderVO {
	
	private String username;
	private long order_id; // 기존 id
	private int member_id;
	private String payment_number;
	private int amount;
	private Timestamp order_date;
	private String status;
	
	// private DeliveryVO delivery;
	private List<DeliveryVO> delivery;
	private List<OrderDetailVO> orderDetails;
	
	


}
