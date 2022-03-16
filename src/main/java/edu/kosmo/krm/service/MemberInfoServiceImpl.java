package edu.kosmo.krm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kosmo.krm.mapper.MemberInfoMapper;
import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

//회원 관리 컨트롤러(회원 정보 리스트, 회원 정보 조회, 회원 정보 수정, 회원 삭제)
//2022-2-23 ~
//양세윤 코드 작성

@Slf4j
@Service
public class MemberInfoServiceImpl implements MemberInfoService {

	@Autowired
	private MemberInfoMapper memberInfoMapper;

	// total 가져오는 함수
	@Override
	public int getTotal() {
		log.info("getTotal...");
		return memberInfoMapper.getTotalCount();
	}

	// 회원 리스트 전체 가져오는 함수 (with paging)
	@Override
	public List<MemberVO> getList(Criteria criteria) {
		log.info("getList...");
		return memberInfoMapper.getListWithPaging(criteria);
	}

	// 회원 정보 조회하는 함수 (회원번호)
	@Override
	public MemberVO get(int id) {
		log.info("get()...");
		return memberInfoMapper.read(id);
	}
	// 회원 정보 조회하는 함수 (회원아이디) - 유빈:장바구니때 사용

	@Override
	public MemberVO getCart(String username) {
		log.info("get()...");
		return memberInfoMapper.readCart(username);
	}

	// 회원 정보 수정하는 함수
	@Override
	public void modify(MemberVO memberVO) {
		log.info("modify()...");
		memberInfoMapper.update(memberVO);

	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void updateuser(MemberVO memberVO) {
		log.info("updateuser()...");
		memberInfoMapper.updateuser(memberVO);
		
	}

}
