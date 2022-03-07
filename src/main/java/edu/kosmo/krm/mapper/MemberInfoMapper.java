package edu.kosmo.krm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.vo.MemberVO;

//회원 관리 매퍼(회원 불러오기 (페이징), 회원 정보 조회, 정보 수정)
//2022-2-23 ~
//양세윤 코드 작성

@Mapper
public interface MemberInfoMapper {

	// 회원 가져오는 코드
	public MemberVO getUser(String username);
	
	// 페이징 관련 코드
	int getTotalCount();

	// 페이징 한 회원 리스트 불러오기
	List<MemberVO> getListWithPaging(Criteria criteria);
	
	// 회원 리스트 불러오기
	List<MemberVO> getList();

	// 회원 정보 조회 코드
	MemberVO read(int id);

	// 회원 정보 수정 코드 (admin)
	MemberVO update(MemberVO memberVO);
	
	// 회원 정보 수정 코드 (user)
	MemberVO updateuser(MemberVO memberVO);
}
