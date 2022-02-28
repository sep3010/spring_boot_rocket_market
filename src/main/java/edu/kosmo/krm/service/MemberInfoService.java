package edu.kosmo.krm.service;

import java.util.List;

import org.springframework.stereotype.Service;

import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.vo.MemberVO;

//회원 관리 컨트롤러(회원 정보 리스트, 회원 정보 조회, 회원 정보 수정, 회원 삭제)
//2022-2-23 ~
//양세윤 코드 작성

@Service
public interface MemberInfoService {

	// 페이징 처리 함수
	public int getTotal();

	// 회원 리스트 가져오는 함수
	public List<MemberVO> getList(Criteria criteria);

	// 회원 조회하는 함수
	public MemberVO get(int id);

	// 회원 정보 수정하는 함수
	void modify(MemberVO memberVO);
	
	// 회원 정보 수정하는 함수
	void updateuser(MemberVO memberVO);
}
