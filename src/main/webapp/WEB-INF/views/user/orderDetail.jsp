<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- fontawesome -->
<script src="https://kit.fontawesome.com/b7ee8a4337.js" crossorigin="anonymous"></script>

<!-- csrf meta tag -->
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>

<title>주문 상세 내역</title>

<script type="text/javascript">
	//csrf
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	
	//Ajax spring security header..
	$(document).ajaxSend(function(e, xhr, options){
		xhr.setRequestHeader(header, token);
	});
	
	
	$(document).ready(function(){
		
		
		
				
	}); // end ready()
	
	
</script>

</head>
<body>
	<h2>주문 상세</h2>
		<table width="870" cellpadding="0" cellspacing="0" border="1">
			<c:forEach var="order" items="${orderDetail}" varStatus="vs">
				<c:if test="${vs.first}">
					<tr>
						<td>주문번호</td>
						<td>${order.order_id}</td>
						<td>주문일자</td>
						<td>${order.order_date}</td>
						<td>배송상태</td>
						<td>${order.status}</td>
					</tr>
					<c:forEach var="delivery" items="${order.delivery}">						
						<tr>
							<td>받는 사람</td>
							<td colspan="2">${delivery.receiver}</td>
							<td>연락처</td>
							<td colspan="2">${delivery.phone}</td>
						</tr>
						<tr>
							<td>우편번호</td>
							<td>${delivery.postcode}</td>
							<td>주소</td>
							<td colspan="3">${delivery.address}</td>
						</tr>
						<tr>
							<td>배송 메세지</td>
							<td colspan="2">${delivery.message}</td>
							<td>운송장번호</td>
							<td colspan="2">${delivery.delivery_number}</td>
						</tr>						
					</c:forEach><%-- <c:forEach var="delivery"> --%>
					<tr>
						<td colspan="3">상품명</td>
						<td>할인율</td>
						<td>가격</td>
						<td>수량</td>
					</tr>
				</c:if><%-- <c:if test="${vs.first}"> --%>
				
				<c:forEach var="detail" items="${order.orderDetails}">
					<c:forEach var="product" items="${detail.products}">
						<form:form action="${pageContext.request.contextPath}/user/review_write" method="post">
							<tr>
								<c:forEach var="image" items="${product.productImages}">
									<input type="hidden" name="path" value="${image.path}">
									<td><img src="${image.path}"></td>
								</c:forEach>				
								<td colspan="2">[${product.brand}] ${product.name}</td>
								
								<td>${product.discount}%</td>		
								<td>${product.price}</td>
								<td>${detail.quantity}</td>
								<td>
									<input type="hidden" name="order_detail_id" value="${detail.order_detail_id}">
									<input type="hidden" name="order_id" value="${detail.order_id}">
									<input type="hidden" name="name" value="${product.name}">
									<input type="hidden" name="brand" value="${product.brand}">	
									<input type="submit" value="후기 작성">
								</td>		
							</tr>	
						</form:form>				
					</c:forEach><%-- <c:forEach var="product"> --%>
				</c:forEach><%-- <c:forEach var="detail"> --%>
				<c:if test="${vs.last}">
					<tr>
						<td>총 가격</td>
						<td>${order.amount}</td>
					</tr>
				</c:if><%-- <c:if test="${vs.last}"> --%>
			</c:forEach><%-- <c:forEach var="order"> --%>
		</table>
		
</body>
</html>