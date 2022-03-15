<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
   <title>내가 쓴 후기 조회</title>
</head>
<body>
   <table width="1000" cellpadding="0" cellspacing="0" border="1">
      <tr>
         <td>주문 번호</td>
         <td>글 번호</td>
         <td>제목</td>   
         <td>작성자</td>   
         <td>내용</td>
         <td>작성일</td>
         <td>조회수</td>
         <td>만족도 점수</td>         
      </tr>
      
      <c:forEach var="review" items="${reviewList}" >
		<tr>    
            <td>${review.order_id}</td>
            <td>${review.board_id}</td>
            <td>${review.title}</td>    
            <td>${review.nickname}</td>
            <td>${review.content}</td>
            <td>${review.board_date}</td>
            <td>${review.hit}</td>    
			<td>
				<c:forEach var="score" items="${ scoreOptions }"
			varStatus="status" begin="1" end="${ review.score }">★</c:forEach>
			</td>                  
         </tr>
      </c:forEach>

   </table>

	<!-- 여기서 << 1 2 3 4 5 >> 이거 만드는 거임 -->
	<c:if test="${pageMaker.pre}">
		<a href="${pageContext.request.contextPath}/user/myReviewList${pageMaker.makeQuery(pageMaker.startPage - 1) }">«</a>
	</c:if>

	<!-- 링크를 걸어준다 1-10페이지까지 페이지를 만들어주는것  -->
	<c:forEach var="idx" begin="${pageMaker.startPage }"
		end="${pageMaker.endPage }">
		<a href="${pageContext.request.contextPath}/user/myReviewList${pageMaker.makeQuery(idx)}">${idx}</a>
	</c:forEach>

	<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
		<a href="${pageContext.request.contextPath}/user/myReviewList${pageMaker.makeQuery(pageMaker.endPage +1) }"> » </a>
	</c:if>
</body>
</html>