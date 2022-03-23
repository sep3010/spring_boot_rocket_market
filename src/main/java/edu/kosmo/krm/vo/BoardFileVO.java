package edu.kosmo.krm.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
이름        널?       유형             
--------- -------- -------------- 
ID        NOT NULL NUMBER(30)     
BOARD_ID           NUMBER(20)     
NAME               VARCHAR2(200)  
EXTENSION          VARCHAR2(10)   
PATH               VARCHAR2(2000)  
 */

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class BoardFileVO {
	
	private int id;	
	private int board_id;
	private String name;
	private String extension;
	private String path;

}
