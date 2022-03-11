package edu.kosmo.krm.page;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
//=============상품목록페이징용====================
@ToString
@Getter
@Setter
public class CriteriaP {
	
	private String etype;
	private int pageNum; // 페이지 번호
	private int amount; // 한 페이지당 들어가는 글의 개수

	public CriteriaP() {
		this(1, 12, null); // 페이지 하나에 12개의 글이 들어간다.
	}

	public CriteriaP(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public CriteriaP(int pageNum, int amount, String etype) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.etype = etype;
	}

}

