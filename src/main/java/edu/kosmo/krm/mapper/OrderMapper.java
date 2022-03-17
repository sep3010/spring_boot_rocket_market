package edu.kosmo.krm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.joinVO.JoinCartProductListVO;
import edu.kosmo.krm.joinVO.JoinOrderHistoryVO;
import edu.kosmo.krm.vo.CartVO;
import edu.kosmo.krm.vo.MemberVO;
import edu.kosmo.krm.vo.ProductVO;

//회원 관리 매퍼(회원 불러오기 (페이징), 회원 정보 조회, 정보 수정)
//2022-2-23 ~
//양세윤 코드 작성

@Mapper
public interface OrderMapper {

	// 주문 내역 가져오는 코드 (with 페이징)
	public List<JoinOrderHistoryVO> getOrderHistoryList(@Param("criteria") Criteria criteria, @Param("memberVO") MemberVO memberVO);
	public int getOrderHistoryTotalCount(MemberVO memberVO);
	/*유빈*/
	// 장바구니 상품넣기 ==================================================================
	@Select("SELECT NVL(MAX(id),0) AS id FROM cart WHERE member_id = #{member_id}")
	public int findCart(CartVO cartVO); //카트찾기
	@Insert("INSERT INTO cart VALUES (cart_SEQ.NEXTVAL, #{member_id}, #{product_id}, #{quantity})")
	public void insertCart(CartVO cartVO);
	@Select("SELECT * FROM cart WHERE member_id = #{member_id}")
	public List<CartVO> getCart(CartVO member_id); //카트찾기
	public List<JoinCartProductListVO> getCartProductList(int member_id);//장바구니 상품목록
	
}
