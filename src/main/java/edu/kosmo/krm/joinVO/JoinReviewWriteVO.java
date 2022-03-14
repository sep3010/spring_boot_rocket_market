/* 
== 리뷰에서 사용할 Join 테이블들 ==
        MEMBER,
        BOARD,
        BOARD_CATEGORY,
        MEMBER_ORDER,
        ORDER_DETAIL,
        ORDER_DETAIL_BOARD
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
public class JoinReviewWriteVO {

	private String nickname;
	private int board_id;
	private String title;
	private String content;
	private Timestamp board_date;
	private int hit;
	private int score;
	private int order_id;
	private int order_detail_id;
	private int order_detail_board_id;
}
