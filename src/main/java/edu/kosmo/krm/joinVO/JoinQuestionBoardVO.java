/* 
== 문의게시판에서 사용할 Join 테이블들 ==
    board,
    reply,
    member
*/

package edu.kosmo.krm.joinVO;

import java.sql.Date;
import java.sql.Timestamp;

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
public class JoinQuestionBoardVO {

	// Board
	private int board_id;
	private int member_id;
	private int board_category_id;
	private String title;
	private String content;
	private Date board_date;
	private String sort;
	private int hit;
	private String scope;
	
	// Member
	private String nickname;
		
	// Reply
	private int reply_id;
	private String reply_content;
	private Date reply_date;
	

}
