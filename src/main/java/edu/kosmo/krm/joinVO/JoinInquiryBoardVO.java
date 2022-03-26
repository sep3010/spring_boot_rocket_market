/* 
== 문의게시판에서 사용할 Join 테이블들 ==
    board,
    reply,
    member
*/

package edu.kosmo.krm.joinVO;

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
public class JoinInquiryBoardVO {

	// Board
	private int id;
	private int member_id;
	private int board_category_id;
	private String title;
	private String content;
	private Timestamp board_date;
	private String sort;
	private int hit;
	private int score;
	private String scope;
	
	// Member
	private String nickname;
	private int member_table_id; // 컬럼 중복으로 이름 수정 (기존: member_id)
	
	// Reply
	private int board_id; // 컬럼 중복으로 이름 수정 (기존: product_id)
	private int count;
	

}
