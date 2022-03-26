package edu.kosmo.krm.vo;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
이름        널?       유형           
--------- -------- ------------ 
MEMBER_ID NOT NULL NUMBER(30)   
AUTHORITY NOT NULL VARCHAR2(30) 
*/

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class BoardVO {
	
	private int id;
	private int member_id;
	private int board_category_id;
	private String title;
	private String content;
	private Date board_date;
	private String sort;
	private int hit;
	private int score;
	private String scope;

}
