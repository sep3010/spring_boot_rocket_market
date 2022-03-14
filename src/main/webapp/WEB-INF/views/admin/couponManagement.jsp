<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>couponManagement</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


</head>
<body>
	<h1>상품목록</h1>
	<p><a href="${pageContext.request.contextPath}/admin/adminHome">이전(관리자홈)</a></p>
	<table width="500" cellpadding="0" cellspacing="0" border="1">
	<tr>
		<td>쿠폰번호</td>
		<td>쿠폰명</td>
		<td>할인율</td>
	</tr>			
	<c:forEach var="coupon" items="${couponList}">
		<tr>
			<td>${coupon.coupon_id}</td>
			<td>${coupon.coupon_name}</td>
			<td>${coupon.coupon_discount}</td>	
		</tr>	
	</c:forEach>

	</table>
	
	<p><a href="${pageContext.request.contextPath}/admin/addCoupon"> 쿠폰등록 </a></p>

</body>
</html>