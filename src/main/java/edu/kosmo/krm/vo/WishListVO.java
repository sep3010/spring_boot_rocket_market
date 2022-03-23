package edu.kosmo.krm.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
이름         널?       유형         
---------- -------- ---------- 
ID         NOT NULL NUMBER(20) 
MEMBER_ID           NUMBER(30) 
PRODUCT_ID          NUMBER(20)  
 */

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class WishListVO {
	
	private int id;
	private int member_id;
	private int product_id;
	
	private List<ProductImageVO> productImages;

}
