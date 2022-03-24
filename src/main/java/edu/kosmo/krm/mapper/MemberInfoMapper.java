package edu.kosmo.krm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.vo.DeliveryVO;
import edu.kosmo.krm.vo.MemberVO;
import edu.kosmo.krm.vo.PaymentInfoVO;

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
	
	@Select("SELECT * FROM member WHERE username = #{username}")
	MemberVO readCart(String username);

	// 회원 정보 수정 코드 (admin)
	MemberVO update(MemberVO memberVO);
	
	// 회원 정보 수정 코드 (user)
	MemberVO updateuser(MemberVO memberVO);
	
	// 비밀번호 유효성 검사 코드
	public String pwCheck(int id);
//	
//	// 비밀번호 변경 코드
//	public void pwUpdate(String member_id, String hashedPw) throws Exception;
	
	// 비밀번호 변경 코드
	public void pwUpdate(String member_id, String hashedPw) throws Exception;

	
	// 결제 후 포인트 차감 함수
	MemberVO updatePoint(PaymentInfoVO paymentInfoVO);
	
	// 배송지 입력
	public void insertDeliveryIfo(DeliveryVO deliveryVO);
	
}
