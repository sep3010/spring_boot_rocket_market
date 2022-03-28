package edu.kosmo.krm.oauth;


import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import edu.kosmo.krm.mapper.MemberMapper;
import edu.kosmo.krm.social.GoogleUserInfo;
import edu.kosmo.krm.social.KakaoUserInfo;
import edu.kosmo.krm.social.OAuth2UserInfo;
import edu.kosmo.krm.vo.MemberCustomDetails;
import edu.kosmo.krm.vo.MemberVO;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CustomOAuth2UserService extends DefaultOAuth2UserService {
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper memberMapper;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
		
	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		OAuth2User oAuth2User = super.loadUser(userRequest);
		log.info("oAuth2User : " + oAuth2User);
		
		OAuth2UserInfo oAuth2UserInfo = null;
		String provider = userRequest.getClientRegistration().getRegistrationId();
		log.info("provider : " + provider);
		
		if(provider.equals("kakao")) {
			oAuth2UserInfo = new KakaoUserInfo(oAuth2User.getAttributes());
			log.info("kakao : " + oAuth2UserInfo);
		}
		else if(provider.equals("google")) {
			oAuth2UserInfo = new GoogleUserInfo(oAuth2User.getAttributes());
			log.info("google : " + oAuth2UserInfo);
		}
		
		String providerId = oAuth2UserInfo.getProviderId();
		// 회원가입 처리나 있는 회원인지 확인하기 위한 아이디 생성해서 DB에 넣어주기
		String user_id = provider + "_" + providerId;
		log.info("user_id : " + user_id);
		
		String nickname = oAuth2UserInfo.getName();
		log.info("nickname : " + nickname);
		String email = oAuth2UserInfo.getEmail();
		log.info("email : " + email);
		
		// 아이디로 DB에 해당 아이디로 검색해서 가져오기
		MemberVO memberVO = memberMapper.getMember(user_id);

		// DB에 없는 사용자라면 회원가입처리
		if(memberVO == null) {
			// 임의의 비밀번호를 생성
			String uuid = UUID.randomUUID().toString();
			String password = passwordEncoder.encode(uuid);
			log.info("password : " + password);
			
			memberMapper.insertSocialMember(user_id, password, nickname, email, provider);
			int id = memberMapper.getId(user_id);
			log.info("id : " + id);
			memberMapper.insertAuthority(id);
			
			memberVO = memberMapper.getMember(user_id);			
		}
				
		return new MemberCustomDetails(memberVO, oAuth2UserInfo);
	}
	

}
