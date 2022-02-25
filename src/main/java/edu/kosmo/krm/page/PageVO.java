package edu.kosmo.krm.page;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

// startPage:1 endPage:10
// < 1 2 3 4 5 6 7 8 9 10 >


@Getter
@Setter
@ToString
public class PageVO {
   
   private int startPage; // 시작 페이지
   private int endPage; // 끝 페이지
   
   private boolean pre, next; // 이전과 다음으로 이동이 가능한 링크 표시
   
   private int total; // 전체 게시판 글 수
   
   private Criteria cri; // Criteria.java 안의 변수 두 개 (pageNum, amount)
   
   public PageVO(Criteria criteria, int total) {
      this.cri = criteria; // Criteria에서 정한 (1, 10)
      this.total = total;
      
      // endPage
      this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;
      
      // startPage
      this.startPage = this.endPage-9;
      
      // realEnd
      int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount())); // 전체 글 수 / 보여 주는 글 수 예를들어 80/10이면 8페이지만 나오는 것임
      
      if (realEnd <= this.endPage) {
         this.endPage = realEnd;
      }
      
      // 시작 번호가 1보다 큰 경우
      this.pre = this.startPage > 1;
      
      // realEnd가 endPage보다 큰 경우에 존재
      // 총 100 페이지, 출력하는 페이지가 90~100일 경우 >> 생략
      this.next = this.endPage < realEnd;
   }
   
   public String makeQuery(int page) {
      UriComponents uriComponentsBuilder = UriComponentsBuilder.newInstance().queryParam("pageNum", page) // pageNum =3
            .queryParam("amount", cri.getAmount()) // pageNum=3&amount=10
            .build(); // ?pageNum=3&amount=10
      return uriComponentsBuilder.toUriString(); // ?pageNum=3&amount=10 리턴
      //return "?pageNum=" + 3 + "&amount="+cri.getAmount();
      
   }
}