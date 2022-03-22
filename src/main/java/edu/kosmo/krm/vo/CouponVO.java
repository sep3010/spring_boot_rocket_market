package edu.kosmo.krm.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
이름       널?       유형           
-------- -------- ------------ 
ID       NOT NULL NUMBER(20)   
NAME              VARCHAR2(50) 
DISCOUNT          NUMBER(10)   

*/

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class CouponVO {
	
	private int coupon_id;
	private String coupon_name;
	private int coupon_discount;

}
