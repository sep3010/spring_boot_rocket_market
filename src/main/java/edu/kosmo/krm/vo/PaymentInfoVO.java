package edu.kosmo.krm.vo;

import lombok.Data;

@Data
public class PaymentInfoVO {
	    public String impuid; // 결제 번호
	    public String merchantid; // 주문 번호
	    public String amount;
	    public String productid;
	    public String input_point;
	    public String user_point;
	    public int result_Point;
	    public String member_id;
	    public int quantity;
	    public String product_name;
	    public String delivery_number;
	    

}
