package edu.kosmo.krm.social;

import java.util.Map;

/*소셜 로그인별 사용자 정보를 받아오기 위한 interface*/
public interface OAuth2UserInfo {
    Map<String, Object> getAttributes();
    String getProviderId();
    String getProvider();
    String getEmail();
    String getName();
}
