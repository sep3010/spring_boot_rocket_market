package edu.kosmo.krm.security;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import edu.kosmo.krm.mapper.MemberMapper;
import edu.kosmo.krm.vo.MemberCustomDetails;
import edu.kosmo.krm.vo.MemberVO;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberCustomDetailsService implements UserDetailsService  {
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper memberMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		log.warn("Load Member By MemverVO userName: " + username);
		MemberVO memberVO = memberMapper.getMember(username);
		
		log.warn("Queried by MemberVO mapper: " + memberVO);
		
		return memberVO == null ? null : new MemberCustomDetails(memberVO);
	}
	
	
}