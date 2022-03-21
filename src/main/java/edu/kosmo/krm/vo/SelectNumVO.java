package edu.kosmo.krm.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
장바구니에서 선택한 상품의 장바구니번호 리스트
 */

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class SelectNumVO {
	//public String numList;
	public ArrayList<String> numList;

}
