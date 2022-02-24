package edu.kosmo.krm.page;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@ToString
@Setter
@Getter
public class Criteria {
	private int pageNum; // 페이지 번호
	private int amount; // 한 페이지당 들어가는 글의 개수
	
	public Criteria() {
		this(1, 10); // 페이지 하나에 10개의 글이 들어간다.
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
