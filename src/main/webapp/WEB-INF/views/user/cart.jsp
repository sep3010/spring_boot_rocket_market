<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userHome</title>
</head>
<body>
	<h1>카트</h1>
	<!-- 메인으로 가는 버튼 -->
	<h1><a href="${pageContext.request.contextPath}/">Main Home</a></h1>
	<table width="950" cellpadding="0" cellspacing="0" border="1">
	<tr>
		<td>회원번호</td>
		<td>상품번호</td>
		<td>이미지</td>			
		<td>상품명</td>
		<td>브랜드</td>
		<td>수량</td>
		<td>가격</td>
		<td>할인율</td>	

	</tr>	
	<c:forEach var="cart" items="${cartProductList}" >
		<tr>
			<td>${cart.member_id}</td>
			<td>${cart.product_id}</td>
			<td><img src="${cart.path}"></td> 
			<td>${cart.name}</td>
			<td>${cart.brand}</td>
			<td>${cart.quantity}</td>
			<td>${cart.price}</td>
			<td>${cart.discount}</td>
		</tr>	
    </c:forEach>
</body>
</html>