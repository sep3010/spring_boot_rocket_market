<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>



<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">

<!-- csrf meta tag -->
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
   <title>배송 정보 입력 및 수정</title>
</head>
<body>
	
	
	<h1>배송 정보 입력</h1>

     
        <sec:authorize access="isAuthenticated()">
           <sec:authentication var="principal" property="principal"/>	
	<c:url value="/inputDelivery" var="inputDeliveryUrl"/>
	
	
	<form:form name="/inputDelivery" action="${inputDeliveryUrl}" method="GET" id="inputDeliveryForm">
			<table width="500 cellpadding=" cellspacing="0" border="1">

				<tr>
					<td><label for="username">아이디</label></td>
					<td><label><sec:authentication property="principal.memberVO.username"/></label></td>
				</tr>
								
				<tr>
					<td><label for="name">우편번호</label></td>
					<td> <input type="text" id="postcode" name="postcode"></td>
				</tr>
			 
				<tr>
					<td><label for="name">주소</label></td>
					<td><input type="text" id="address" name="address"></td>
				</tr>
			        
				<tr>
					<td><label for="nickname">수령인</label></td>
					<td> <input type="text" id="receiver" name="receiver"></td>
				</tr>
	
				<tr>
					<td><label for="phone">배송 메세지</label></td>
					<td> <input type="text" id="message" name="message"></td>
				</tr>
	
			</table>
			
				<br>
				<button type="submit" id="deliverySubmit" class="btn" onclick="check_onclick()">배송 정보 입력></button>
				<a type="button" href="/">배송 정보 입력</button>
			</form:form>	
			</sec:authorize>
	
</body>
</html>