/* 
== 베스트상품에서 사용할 Join 테이블들 ==
  	product,
  	product_image,  	  	
  	order_detail
    board,
*/

package edu.kosmo.krm.joinVO;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

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
public class JoinBestProductVO {

	// Product
	private int id;
	private String name;
	private int price;
	private String capacity;
	private String brand;
	private int stock;
	private String unit;
	private String type;
	private String packaging;
	private int discount;
	private String delivery_type;
	private int enabled;
	
	// Product_Image
	private int image_id; // 컬럼 중복으로 이름 수정 (기존: id)	
	private int product_id;
	private String extension;
	private String image_name; // 컬럼 중복으로 이름 수정 (기존: name)
	private String information_type;
	private String path;

	// Order_Detail
	private int score_product_id; // 컬럼 중복으로 이름 수정 (기존: product_id)

	// Board
	private int product_score; // 컬럼 이름 수정 (기존: AVG(b.score))
	
}	
