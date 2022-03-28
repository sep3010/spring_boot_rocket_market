package edu.kosmo.krm.vo;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
이름         널? 유형         
---------- -- ---------- 
PRODUCT_ID    NUMBER(20) 
QUANTITY      NUMBER(30) 
SALES_DATE    DATE    
 */

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class ProductSalesVO {
	
	private int product_id;
	private int quantity;
	private Date sales_date;

}
