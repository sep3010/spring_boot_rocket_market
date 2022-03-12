package edu.kosmo.krm.vo;


import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

import edu.kosmo.krm.social.OAuth2UserInfo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Getter
@Setter
@ToString
public class MemberCustomDetails implements UserDetails, OAuth2User {
	
	private MemberVO memberVO;
	
	// 소셜 로그인을 위한 처리
	private OAuth2UserInfo oAuth2UserInfo;

	
	//생성자(Constructors)
	// Form 로그인시 사용
	public MemberCustomDetails(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	
	//OAuth2User : OAuth2 로그인 시 사용
    public MemberCustomDetails(MemberVO memberVO, OAuth2UserInfo oAuth2UserInfo) {
        //CustomOAuth2UserService 참고
    	this.memberVO = memberVO;
        this.oAuth2UserInfo = oAuth2UserInfo;   
    }
	
	
	//유저가 가지고 있는 권한 목록
	private static Collection<? extends GrantedAuthority> getAuth(MemberVO memberVO) {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		
		for (AuthVO auth : memberVO.getAuthList()) {
			authorities.add(new SimpleGrantedAuthority(auth.getAuthority()));
		}
		return authorities;
	}


	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return getAuth(memberVO);
	}

	@Override
	public String getPassword() {
		return memberVO.getPassword();
	}

	@Override
	public String getUsername() {
		return memberVO.getUsername();
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}
	
	/*OAuth2User 구현*/
	@Override
	public Map<String, Object> getAttributes() {
		return oAuth2UserInfo.getAttributes();
	}

	@Override
	public String getName() {
		return oAuth2UserInfo.getProviderId();
	}


	   
	
}