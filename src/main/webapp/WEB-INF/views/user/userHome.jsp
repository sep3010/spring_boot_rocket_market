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

	<!-- 메인으로 가는 버튼 -->
	<h1><a href="${pageContext.request.contextPath}/">Main Home</a></h1>
	<h1>User Home</h1>
	
	<!-- 로그인을 안했다면 -->
	<sec:authorize access="isAnonymous()">
		<p>
			<a href="${pageContext.request.contextPath}/loginForm">로그인</a>
			<a href="${pageContext.request.contextPath}/addMemberForm">회원가입</a>
			<a href="${pageContext.request.contextPath}/">Home</a>
		</p>
	</sec:authorize>
	
	<!-- 로그인을 했다면 -->
	<sec:authorize access="isAuthenticated()">
		<form:form action="${pageContext.request.contextPath}/logout"
			method="POST">
			<input type="submit" value="로그아웃" />
		</form:form>			
	</sec:authorize>	 
	
	<br><a href="${pageContext.request.contextPath}/user/userUpdateForm">회원 정보 수정</a>
	
	<h4>MY 쇼핑</h4>
	<br><a href="${pageContext.request.contextPath}/user/orderhistory">주문 내역</a>
	<br><a href="">위시리스트</a>
	<br><a href="">쿠폰목록</a>
	<br><a href="${pageContext.request.contextPath}/user/myReviewList">내가 쓴 문의</a>
	
	<h3>주문/배송</h3>
	<p></p>
	
	<h3>적립금</h3>
	<p></p>
	
	<h3>쿠폰</h3>
	<p></p>
	
	<table width="700" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<td>주문 내역</td>
		</tr>
		
		
		<tr>
			<td>쿠폰</td>
		</tr>
	
	</table>
	
	
</body>
</html>