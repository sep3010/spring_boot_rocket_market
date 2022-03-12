<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
   <title>주문 조회</title>
</head>
<body>
   <table width="1000" cellpadding="0" cellspacing="0" border="1">
      <tr>
         <td>주문 번호</td>
         <td>주문 일자</td>
         <td>썸네일</td>      
         <td>상품 브랜드</td>
         <td>상품 이름</td>
         <td>주문 상태</td>
         <td>총 결제 금액</td>
         <td>후기 작성</td>         
      </tr>
      
      <c:forEach var="order" items="${orderList}" >
         <tr>
            <td>${order.order_id}</td>
            <td>${order.order_date}</td>
 			<c:choose>
				<c:when test="${not empty order.img_id}">
					<c:forEach var="thumbnail" items="${orderList}">
						<td><img src="${thumbnail.path}"></td>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<td>대표 이미지 없음</td>
				</c:otherwise>
			</c:choose>       
            <td>${order.brand}</td>
            <td>${order.product_name}</td>
            <td>${order.status}</td>    
            <td>${order.amount}</td>
            <td>
				<a href="/user/review_write">후기 작성</a>
			</td>                                         
         </tr>
      </c:forEach>

   </table>

	<!-- 여기서 << 1 2 3 4 5 >> 이거 만드는 거임 -->
	<c:if test="${pageMaker.pre}">
		<a href="${pageContext.request.contextPath}/user/orderhistory${pageMaker.makeQuery(pageMaker.startPage - 1) }">«</a>
	</c:if>

	<!-- 링크를 걸어준다 1-10페이지까지 페이지를 만들어주는것  -->
	<c:forEach var="idx" begin="${pageMaker.startPage }"
		end="${pageMaker.endPage }">
		<a href="${pageContext.request.contextPath}/user/orderhistory${pageMaker.makeQuery(idx)}">${idx}</a>
	</c:forEach>

	<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
		<a href="${pageContext.request.contextPath}/user/orderhistory${pageMaker.makeQuery(pageMaker.endPage +1) }"> » </a>
	</c:if>
</body>
</html>