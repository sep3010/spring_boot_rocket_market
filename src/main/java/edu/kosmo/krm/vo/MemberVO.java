package edu.kosmo.krm.vo;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
이름       널?       유형            
-------- -------- ------------- 
ID       NOT NULL NUMBER(30)    
USERNAME          VARCHAR2(50)  
PASSWORD          VARCHAR2(500) 
NICKNAME          VARCHAR2(50)  
NAME              VARCHAR2(50)  
PHONE             VARCHAR2(50)  
POSTCODE          VARCHAR2(20)  
ADDRESS           VARCHAR2(300) 
BIRTH             DATE          
GRADE             VARCHAR2(10)  
EMAIL             VARCHAR2(100) 
POINT             NUMBER(20) 
*/

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class MemberVO {
	
	private int id;
	private String username;
	private String password;
	private String nickname;
	private String name;
	private String phone;
	private String postcode;
	private String address;
	private Date birth;
	private String grade;
	private String email;
	private int point;
	
	//private String birth2;
	
	//private int member_id;
	//private String authority;
	
	private List<AuthVO> authList;

}
