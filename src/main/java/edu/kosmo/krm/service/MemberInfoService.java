package edu.kosmo.krm.service;

import java.util.List;

import org.springframework.stereotype.Service;

import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.vo.MemberVO;
import edu.kosmo.krm.vo.PaymentInfoVO;

//회원 관리 컨트롤러(회원 정보 리스트, 회원 정보 조회, 회원 정보 수정, 회원 삭제)
//2022-2-23 ~
//양세윤 코드 작성

public interface MemberInfoService {

	// 페이징 처리 함수
	public int getTotal();

	// 회원 리스트 가져오는 함수
	public List<MemberVO> getList(Criteria criteria);

	// 회원 조회하는 함수
	public MemberVO get(int id);
	public MemberVO getForCart(String username); //아이디로 회원번호가져오기 - 장바구니
	
	// 회원 정보 수정하는 함수
	void modify(MemberVO memberVO);
	
	// 회원 정보 수정하는 함수
	void updateuser(MemberVO memberVO);
	
	// 비밀번호 유효성 체크하는 함수
	public String pwCheck(int id);
	
	// 결제 후 포인트 차감 함수
	void updatePoint(PaymentInfoVO paymentInfoVO);
}