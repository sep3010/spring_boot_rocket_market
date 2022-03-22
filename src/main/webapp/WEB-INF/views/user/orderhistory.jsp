<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
   <title>주문 조회</title>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- csrf meta tag -->
	<meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
   
   <script type="text/javascript">
		//csrf
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		
		//Ajax spring security header..
		$(document).ajaxSend(function(e, xhr, options){
			xhr.setRequestHeader(header, token);
		});
		
	
		$(document).ready(function(){
			
			
			// 상품 상세 팝업 띄우기
			$(".orderDetail").on("click", function(event){
				event.preventDefault();
				
				let popURL = $(this).attr("href");
				console.log("popURL : " + popURL);
				
				let popUp = window.open(popURL, 'orderDetail',
						'top=20, left=300, width=800px, height=700px, scrollbars=yes');
				
				
				
			});
	   
		}); //end ready()
	
	</script>
</head>
<body>
	<h2>주문 내역</h2>
   <table width="1000" cellpadding="0" cellspacing="0" border="1">
      <tr>
         <td>주문 번호</td>
         <td>주문 일자</td>     
         <td>주문 상품</td>
         <td>총 결제 금액</td>
         <td>주문 상태</td>
         <td>운송장번호</td>
         <td>상세 내역 보기</td>         
      </tr>
      
      <c:forEach var="order" items="${orderList}" varStatus="status">
         <tr>
            <td>${order.order_id}</td>
            <td>${order.order_date}</td>
            <c:forEach var="details" items="${order.orderDetails}" varStatus="status">
            	<c:if test="${status.first}">
	            	<c:forEach var="products" items="${details.products}" varStatus="vars">      
	            		<c:if test="${vars.last}">
	            			<c:set var="product_name" value="${products.name}"/>
	            			<c:set var="num" value="${vars.count - 1}"/>
	            			<td>
	            				<c:out value="${product_name}"></c:out>  
	            				<c:if test="${num > 0}">
	            					 외 <c:out value="${num}"></c:out>개
	            				</c:if>		
	            			</td>
	            		</c:if>	            		
	            	</c:forEach>
            	</c:if>
            	
            </c:forEach>           
            <td>${order.amount}</td>
            <td>${order.status}</td>
            <c:forEach var="delivery" items="${order.delivery}" varStatus="vs">
	           	<c:if test="${vs.last}">
	           		<c:if test="${not empty delivery.delivery_number}">
	           			<td>${delivery.delivery_number}</td>
	           		</c:if>
	           		<c:if test="${empty delivery.delivery_number}">
	           			<td>운송장 없음</td>
	           		</c:if>
	            </c:if>	          	
            </c:forEach>
                
            <td>
				<a class="orderDetail" href="${pageContext.request.contextPath}/user/orderDetail/${order.order_id}">상세 내역보기</a>
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