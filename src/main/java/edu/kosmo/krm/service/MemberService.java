package edu.kosmo.krm.service;


import org.springframework.stereotype.Service;

import edu.kosmo.krm.vo.MemberVO;

@Service
public interface MemberService {
	
	//회원정보를 불러올때
	public MemberVO getMemeber(String username);
	
	//아이디중복체크
	public int idCheck(String username);
	
	//회원가입시 정보입력
	public void addMember(MemberVO memberVO);


}
