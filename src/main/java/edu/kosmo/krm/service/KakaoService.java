package edu.kosmo.krm.service;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import edu.kosmo.krm.vo.KakaoAuth;
import lombok.extern.slf4j.Slf4j;

/*소은*/

@Slf4j
@Service
public class KakaoService {
	// 앱 REST API 키
	private final static String KAKO_CLIENT_ID = "04ddf41511a636142247f0731b85a62d";
	// 토큰을 발급 받기 위한 인증 코드가 redirect 될 주소
	private final static String KAKO_REDIRECT_URI = "http://localhost:8282/auth/kakao/callback";
	// csrf 방어를 위한 발급한 임의의 문자열 코드
	private final static String KAKO_CLIENT_SECRET = "h6V2e9n9UsJaMA15FlC5pJZtKpbdNodK";
	
	public String getKakaoLoginURL() {
		String kakaoLoginURL = "https://kauth.kakao.com/oauth/authorize?client_id="
				+ KAKO_CLIENT_ID + "&redirect_uri=" + KAKO_REDIRECT_URI 
				+ "&response_type=code&state=" + KAKO_CLIENT_SECRET;
		
		return kakaoLoginURL;
	}
	
	// 토큰 발급 요청 주소
	private final static String KAKAO_TOKEN_URI = "https://kauth.kakao.com/oauth/token";
	
	// 토큰을 받기 위해 http body에 인증 내역을 담아 post로 요청 하기 위한 처리 
	public KakaoAuth getkakaoTokenInfo(String code, String state) {
		log.info("getkakaoTokenInfo()..");
		
		// Spring 3.0 부터 지원하는 Spring의 HTTP 통신 템플릿
		// HTTP 요청 후 JSON, XML, String 과 같은 응답을 받을 수 있는 템플릿
		// Spring 5.0부터는 더 이상 지원을 않하는 기능으로 5버전부터는 WebClient를 사용한다.
		RestTemplate restTemplate = new RestTemplate();
		
		/*
		curl -v -X POST "https://kauth.kakao.com/oauth/token" \
		 -H "Content-Type: application/x-www-form-urlencoded" \
		 -d "grant_type=authorization_code" \
		 -d "client_id=${REST_API_KEY}" \
		 --data-urlencode "redirect_uri=${REDIRECT_URI}" \
		 -d "code=${AUTHORIZE_CODE}"
		*/
		
		// Http header에 세팅
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
		// headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
		
		// Http body에 넣을 값
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", KAKO_CLIENT_ID);
		params.add("redirect_uri", KAKO_REDIRECT_URI);
		params.add("code", code);
		params.add("client_secret", state);
		
		// Http body와 header에 값 넣기(POST로 값을 전달하기 위해서)
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(params, headers);
		
		// 실제로 POST 방식으로 http 요청하고, 응답받기
		ResponseEntity<String> responseEntity 
		= restTemplate.postForEntity(KAKAO_TOKEN_URI, kakaoTokenRequest, String.class);
		// (post로 요청 보낼 주소, 요청 보낼 내용(http body와 header 값), 응답 받을 값의 데이터 타입)
		
		/* 이렇게 보낼 수도 있다.
		ResponseEntity<String> responseEntity 
		= restTemplate.exchange(KAKAO_TOKEN_URI, HttpMethod.POST, kakaoTokenRequest, String.class);
		*/
		
		/* 요청 성공시 응답받을 내용 : JSON 형태로 전달 됌
		HTTP/1.1 200 OK
		Content-Type: application/json;charset=UTF-8
		{
		    "token_type":"bearer",
		    "access_token":"${ACCESS_TOKEN}",
		    "expires_in":43199,
		    "refresh_token":"${REFRESH_TOKEN}",
		    "refresh_token_expires_in":25184000,
		    "scope":"account_email profile"
		}
		*/
		
		log.info("responseEntity kakao token(JSON) : " + responseEntity.getBody());
		
		// Gson ,Json Simple, ObjectMapper 3가지가 있고, 
		// ObjectMapper는 내장 객체, gson은 라이브러리 추가 필요.
		ObjectMapper objectMapper = new ObjectMapper();
		
		// 토큰 요청 성공시 받은 json 값을 KakaoAuth에 넣어 반환
		if(responseEntity.getStatusCode() == HttpStatus.OK) {
			try {
				return  objectMapper.readValue(responseEntity.getBody(), KakaoAuth.class);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}
		
		
		return null;
	}
	
	
	
	

}
