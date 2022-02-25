package edu.kosmo.krm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kosmo.krm.mapper.MemberMapper;
import edu.kosmo.krm.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper memberMapper;
	
	//암호화객체
	@Autowired
	private PasswordEncoder passwordEncoder;

	//회원정보 가져오기
	@Override
	public MemberVO getMemeber(String username) {
		log.info("readMember..");
		
		log.info("username : " + username);
		MemberVO memberVO = memberMapper.getMember(username);
		memberVO.setAuthList(memberMapper.readAuthority(username));
		
		return memberVO;
	}

	//회원가입
	@Override
	@Transactional(rollbackFor = Exception.class)
	public void addMember(MemberVO memberVO) {
		
		log.info("addMember..");
		//암호화
		String password = memberVO.getPassword();
		String encode = passwordEncoder.encode(password);
		log.info("addMemeber 암호화 완료");
		
		memberVO.setPassword(encode);
		log.info("addMemeber 암호화비번 세팅 완료");
		
		memberMapper.insertMember(memberVO);
		int id = memberMapper.getId(memberVO.getUsername());
		memberMapper.insertAuthority(id);
	}
	
	//아이디 중복체크
	@Override
	public int idCheck(String username) {
		log.info("idCheck.. : " + username);
		int count = memberMapper.idCheck(username);
		
		log.info("count"+count);
		return count;
	}



}
