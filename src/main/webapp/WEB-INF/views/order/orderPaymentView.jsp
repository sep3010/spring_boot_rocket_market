<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문결제 페이지</title>
    
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

<!-- csrf meta tag -->
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>




</head>
<body>
    
    <h1>주문결제 페이지</h1>
    <span>01 장바구니 > </span>
    <span>02 주문 | 결제 > </span>
    <span style="font-weight: bold; color : red;">03 주문 완료</span>

	<h1>주문 완료</h1>
	
	<sec:authentication property="principal.memberVO.name"/>님의 주문이 완료되었습니다!
	
	<div>결제 금액</div>
	<div>${discountAmount }원</div>
	
	<a href="${pageContext.request.contextPath}/">홈으로 가기</a>
	<br><a href="${pageContext.request.contextPath}/user/orderhistory">주문 내역 확인하기</a>
	
	
	

  
</body>
</html>