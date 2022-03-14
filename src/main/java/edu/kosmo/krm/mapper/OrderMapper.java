package edu.kosmo.krm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.joinVO.JoinOrderHistoryVO;
import edu.kosmo.krm.vo.MemberVO;
import edu.kosmo.krm.vo.ProductVO;

//회원 관리 매퍼(회원 불러오기 (페이징), 회원 정보 조회, 정보 수정)
//2022-2-23 ~
//양세윤 코드 작성

@Mapper
public interface OrderMapper {

	// 주문 내역 가져오는 코드 (with 페이징)
	List<JoinOrderHistoryVO> getOrderHistoryList(@Param("criteria") Criteria criteria, @Param("memberVO") MemberVO memberVO);
	int getOrderHistoryTotalCount(MemberVO memberVO);
	
}
