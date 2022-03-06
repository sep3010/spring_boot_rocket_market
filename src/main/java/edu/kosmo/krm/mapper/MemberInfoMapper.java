package edu.kosmo.krm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.vo.MemberVO;

@Mapper
public interface MemberInfoMapper {


	// 페이징 관련 코드
	int getTotalCount();

	// 페이징 한 회원 리스트 불러오기
	List<MemberVO> getListWithPaging(Criteria criteria);

	// 회원 정보 조회 코드
	MemberVO read(int id);

	// 회원 정보 수정 코드
	MemberVO update(MemberVO memberVO);
}