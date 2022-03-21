package edu.kosmo.krm.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
이름              널?       유형         
--------------- -------- ---------- 
ID              NOT NULL NUMBER(20) 
ORDER_DETAIL_ID          NUMBER(30) 
BOARD_ID                 NUMBER(20) 
 */

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class OrderDetailBoardVO {
	
	private int id;	
	private int order_detail_id;
	private int board_id;

}
