package edu.kosmo.krm.vo;

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
public class AuthVO {
	private int member_id;
	private String authority;

}
