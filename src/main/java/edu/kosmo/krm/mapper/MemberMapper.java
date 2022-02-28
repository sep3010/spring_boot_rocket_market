package edu.kosmo.krm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import edu.kosmo.krm.vo.AuthVO;
import edu.kosmo.krm.vo.MemberVO;

@Mapper
public interface MemberMapper {
	
	// 로그인한 회원 정보 가져오기
	public MemberVO getMember(String username);
	
	// 가입한 회원의 권한 설정을 위한 id값 가져오기
	@Select("SELECT id FROM member WHERE username = #{username}")
	public int getId(String username);
	
	// 권한 읽기
	@Select("SELECT id,CASE WHEN username ='admin' THEN 'ROLE_ADMIN' ELSE 'ROLE_USER' END authority FROM member WHERE username = #{username}")
	public List<AuthVO> readAuthority(String username);
	
	// 홈페이지에서 회원가입
	public void insertMember(MemberVO memberVO);
	
	// 처음 회원가입시 user로 권한 설정
	@Insert("INSERT INTO authority VALUES (#{id}, 'ROLE_USER')")
	public void insertAuthority(int id);
	
	// 카카오 로그인시 강제 회원가입
	public void insertKakaoMember(@Param("id") String id, 
			@Param("nickname") String nikname, @Param("email") String email);
	
	// 카카오 로그인시 기존에 가입된 회원인지 확인하기
	@Select("SELECT * FROM member WHERE username = #{id} AND platform_type = 'kakao'")
	public MemberVO checkKakaoMember(String id);

}
