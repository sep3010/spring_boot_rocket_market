package edu.kosmo.krm.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
이름               널?       유형             
---------------- -------- -------------- 
ID               NOT NULL NUMBER(20)     
PRODUCT_ID                NUMBER(20)     
EXTENSION                 VARCHAR2(10)   
NAME                      VARCHAR2(200)  
INFORMATION_TYPE          VARCHAR2(30)   
PATH                      VARCHAR2(2000)  
 */

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class ProductImageVO {
	
	private int id;	
	private int product_id;
	private String extension;
	private String name;
	private String information_type;
	private String path;


}
