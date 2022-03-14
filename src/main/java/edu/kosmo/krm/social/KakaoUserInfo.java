package edu.kosmo.krm.social;

import java.util.Map;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
{
	"id":2138000000,
	"connected_at":"2022-02-27T06:29:28Z",
	"properties":{"nickname":"이름",
					"profile_image":"프로필 이미지.jpg",
					"thumbnail_image":"썸네일.jpg"},
	"kakao_account":{"profile_nickname_needs_agreement":false,
						"profile_image_needs_agreement":false,
						"profile":{"nickname":"이름",
									"thumbnail_image_url":".jpg",
									"profile_image_url":".jpg",
									"is_default_image":false},
						"has_email":true,
						"email_needs_agreement":false,
						"is_email_valid":true,
						"is_email_verified":true,
						"email":""
					  }
}
*/

/*kakao 로그인시 사용자 정보 받아오기*/
@ToString
@Getter
@Setter
public class KakaoUserInfo implements OAuth2UserInfo {
	private Map<String, Object> attributes;
    private Map<String, Object> attributesAccount;
    private Map<String, Object> attributesProfile;
    
	public KakaoUserInfo(Map<String, Object> attributes) {
		this.attributes = attributes;
		this.attributesAccount = (Map<String, Object>)attributes.get("kakao_account");
		this.attributesProfile = (Map<String, Object>)attributes.get("properties");
	}

	@Override
	public Map<String, Object> getAttributes() {
		return attributes;
	}

	@Override
	public String getProviderId() {
		// spring.security.oauth2.client.provider.kakao.user-name-attribute=id
		return attributes.get("id").toString();
	}

	@Override
	public String getProvider() {
		// spring.security.oauth2.client.registration.kakao.client-name=kakao
		return "kakao";
	}

	@Override
	public String getEmail() {
		return attributesAccount.get("email").toString();
	}

	@Override
	public String getName() {
		return attributesProfile.get("nickname").toString();
	}
    
}
