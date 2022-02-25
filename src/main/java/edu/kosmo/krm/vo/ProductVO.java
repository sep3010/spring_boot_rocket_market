package edu.kosmo.krm.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
이름            널?       유형            
------------- -------- ------------- 
ID            NOT NULL NUMBER(20)    
NAME                   VARCHAR2(100) 
PRICE                  NUMBER(20)    
CAPACITY               VARCHAR2(20)  
BRAND                  VARCHAR2(20)  
STOCK                  NUMBER(20)    
UNIT                   VARCHAR2(20)  
TYPE                   VARCHAR2(20)  
PACKAGING              VARCHAR2(20)  
DISCOUNT               NUMBER(10)    
DELIVERY_TYPE          VARCHAR2(20)  
ENABLED                NUMBER(10)    
 */

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class ProductVO {
	
	private int id;
	private String name;
	private int price;
	private String capacity;
	private String brand;
	private int stock;
	private String unit;
	private String type;
	private String packaging;
	private int discount;
	private String delivery_type;
	private int enabled;

}
