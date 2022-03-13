package edu.kosmo.krm.social;

import java.util.Map;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
{
    sub=~(고유 아이디), 
    name=~, 
    given_name=~, 
    family_name=~, 
    picture=~, 
    email=~, 
    email_verified=true, 
    locale=ko
}
*/

/*google 로그인시 사용자 정보 받아오기*/
@ToString
@Getter
@Setter
public class GoogleUserInfo implements OAuth2UserInfo {
	private Map<String, Object> attributes;
    
	public GoogleUserInfo(Map<String, Object> attributes) {
		this.attributes = attributes;

	}

	@Override
	public Map<String, Object> getAttributes() {
		return attributes;
	}

	@Override
	public String getProviderId() {
		return attributes.get("sub").toString();
	}

	@Override
	public String getProvider() {
		return "google";
	}

	@Override
	public String getEmail() {
		return attributes.get("email").toString();
	}

	@Override
	public String getName() {
		return attributes.get("name").toString();
	}
    
}
