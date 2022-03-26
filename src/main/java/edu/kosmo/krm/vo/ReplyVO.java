package edu.kosmo.krm.vo;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
이름         널? 유형            
---------- -- ------------- 
ID            NUMBER(20)    
BOARD_ID      NUMBER(20)    
CONTENT       VARCHAR2(300) 
REPLY_DATE    DATE 
*/

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class ReplyVO {
	
	private int id;
	private int board_id;
	private String content;
	private Date reply_date;

}
