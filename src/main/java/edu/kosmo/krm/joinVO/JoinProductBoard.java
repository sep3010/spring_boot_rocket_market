/* 
== 상품상세페이지에서 사용할 Join 테이블들 ==
  	order_detail
    order_detail_board,
    board,
    member
*/

package edu.kosmo.krm.joinVO;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;



@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class JoinProductBoard {

	
	// Order_detail
	private int product_id;

	// Board
	private String content; 
	private Date board_date;
	private int score;
	
	// member
	private String nickname;
	
}	
