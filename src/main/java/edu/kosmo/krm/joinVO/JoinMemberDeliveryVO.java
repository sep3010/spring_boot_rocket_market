/* 
== 쿠폰에서 사용하는 Join 테이블들 ==
	MEMBER M,
	DELIVERY D
*/

package edu.kosmo.krm.joinVO;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import edu.kosmo.krm.vo.ProductImageVO;
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
public class JoinMemberDeliveryVO {

	private String postcode;
	private String address;
	private String phone;
	private String message;
	private String receiver;
	

}
