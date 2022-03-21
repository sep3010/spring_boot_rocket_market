/* 
이름                널?       유형            
----------------- -------- ------------- 
ID                NOT NULL NUMBER(20)    
MEMBER_ID                  NUMBER(30)    
BOARD_CATEGORY_ID          NUMBER(10)    
TITLE                      VARCHAR2(200) 
CONTENT                    VARCHAR2(800) 
BOARD_DATE                 DATE          
SORT                       VARCHAR2(20)  
HIT                        NUMBER(10)    
SCORE                      NUMBER(5)     
SCOPE                      VARCHAR2(10) 
*/

package edu.kosmo.krm.joinVO;

import java.sql.Timestamp;
import java.util.List;

import edu.kosmo.krm.vo.BoardFileVO;
import edu.kosmo.krm.vo.OrderDetailBoardVO;
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
public class JoinReviewBoardVO {

	private int user_id;
	private String nickname;
	private int board_id;
	private String title;
	private String content;
	private Timestamp board_date;
	private int hit;
	private int score;
	
	private OrderDetailBoardVO orderDetailBoard;
	private List<BoardFileVO> boardFiles;
	
}
