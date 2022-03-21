<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
        integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous" />
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

    <title>Rocket Market :: 신속배송</title>
    <link rel="shortcut icon" type="image/x-icon" href="logo.png" />

    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">


</head>


<body>
	<h1><a href="${pageContext.request.contextPath}/">Main Home</a></h1>

	<h1>주문상세페이지입니다.</h1>
	
	
	<table width="950" cellpadding="0" cellspacing="0" border="1">
	<tr>
		<td>장바구니번호</td>
		<td>회원번호</td>
		<td>상품번호</td>		
		<td>상품명</td>
		<td>수량</td>
		<td>가격</td>
		<td>총금액</td>	
	</tr>
	<c:forEach var="cart" items="${cartProductList}" >	
		<tr>
			<td>${cart.cart_id}</td>
			<td>${cart.member_id}</td>
			<td>${cart.product_id}</td>
			<td><img src="${cart.path}">[${cart.brand}]${cart.name}</td>
			<td>${cart.quantity}</td>
			<td class="eachPrice">${cart.price}</td>
			<c:set var="productTotalPrice" value="${(cart.price * (1- (cart.discount/100))) * cart.quantity}"/>
			<td><fmt:formatNumber value="${productTotalPrice}" pattern="#,###"/>원</td>
			<c:set var="totalPrice" value="${totalPrice + productTotalPrice }"/>
		</tr>
	</c:forEach>	
	</table>		  	
      
      
		
</body>
</html>