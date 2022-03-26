package edu.kosmo.krm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PutMapping;

import edu.kosmo.krm.joinVO.JoinInquiryBoardVO;
import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.vo.BoardVO;
import edu.kosmo.krm.vo.CouponVO;



@Mapper
public interface BoardMapper {
	
	// ========== 공지사항 ==========
	
	// 공지사항 목록 조회 + 페이징
	@Select("select count(*) from board where board_category_id = 1")
	public int getNoticeTotalCount();
	
	public List<BoardVO> getNoticeBoardWithPaging(Criteria criteria);
	
	// 개별 공지사항 조회
	@Select("Select * from board where id = #{id}")
	public BoardVO getNotice(int id);
	
	// 공지사항 작성
	public void postNotice(BoardVO boardVO);
	
	// 공지사항 삭제
	@Delete("delete from board where id = #{id}")
	public void deleteNotice(int id);
	
	//공지사항 수정
	public void modifyNotice(BoardVO boardVO);
	
	// ========== 문의사항 ==========
	
	// 문의사항 목록 조회 + 페이징
	@Select("SELECT COUNT(*) FROM board WHERE board_category_id = 2")
	public int getInquiryTotalCount();
	public List<JoinInquiryBoardVO> getInquiryBoardWithPaging(Criteria criteria);
	
	// 개별 문의사항 조회
	@Select("Select * from board where id = #{id}")
	public BoardVO getInquiry(int id);
	
	// 문의사항 작성
	@Insert("INSERT INTO board VALUES (board_SEQ.NEXTVAL, #{member_id}, 2, #{title}, #{content}, SYSDATE, #{sort}, 0, null, #{scope})")
	public void postInquiry(BoardVO boardVO);
	
	// 문의사항 삭제
	@Delete("delete from board where id = #{id}")
	public void deleteInquiry(int id);
	
	// 게시글 작성자 회원번호
	@Select("SELECT member_id FROM board WHERE id = #{id}")
	public int getBoardWriterNum(int id);
	
	// 글조회수 업데이트
	@Update("UPDATE board SET hit = hit + 1 WHERE id = #{id}")
	public void upHit(int id);


}
