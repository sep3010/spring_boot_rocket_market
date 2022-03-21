package edu.kosmo.krm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.joinVO.JoinOrderHistoryVO;
import edu.kosmo.krm.vo.MemberOrderVO;
import edu.kosmo.krm.vo.MemberVO;
import edu.kosmo.krm.vo.ProductVO;

//회원 관리 매퍼(회원 불러오기 (페이징), 회원 정보 조회, 정보 수정)
//2022-2-23 ~
//양세윤 코드 작성

@Mapper
public interface OrderHistoryMapper {

	// 회원 마이페이지 주문 내역 조회
	List<MemberOrderVO> getMemberOrderHistory(@Param("criteria") Criteria criteria, @Param("memberVO") MemberVO memberVO);
	
	// 회원 주문 상세 조회
	List<MemberOrderVO> getMemberOrderDetail(@Param("order_id") long order_id, @Param("user_id") int user_id);
	
}
