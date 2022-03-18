/* 
== 장바구니에서 사용할 Join 테이블들 ==
    cart,
    product,
    product_image
*/

package edu.kosmo.krm.joinVO;

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
public class JoinCartProductListVO {

	// Cart
	private int cart_id; // 컬럼 중복으로 이름 수정 (기존: id)
	private int member_id;
	private int product_id;
	private int quantity;
	
	// Product
	private int id;
	private String name;
	private int price;
	private String brand;
	private int discount;
	
	// Product_Image
	private int image_product_id; // 컬럼 중복으로 이름 수정 (기존: product_id)
	private String path;
	

}
