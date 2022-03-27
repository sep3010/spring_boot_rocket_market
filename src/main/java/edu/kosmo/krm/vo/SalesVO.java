package edu.kosmo.krm.vo;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
년, 월, 일 별 매출합계를 구해 담기위한 vo  
 */

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class SalesVO {
	
	private int sale_year;
	private int sale_month;
	private int sale_day;
	private int sum;

}
