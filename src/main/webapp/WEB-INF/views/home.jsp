<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>HOME</h1>
	<!-- 로그인을 안했다면 -->
	<sec:authorize access="isAnonymous()">
		<p>
			<a href="${pageContext.request.contextPath}/loginForm">로그인</a>
			<a href="${pageContext.request.contextPath}/addMemberForm">회원가입</a>
			<a href="${pageContext.request.contextPath}/user/userHome">유저</a>
			<a href="${pageContext.request.contextPath}/admin/adminHome">관리자</a>
		</p>
		
		<table width="500" cellpadding="0" cellspacing="0" border="1">
			<tr>
				<td>상품이름</td>
				<td>가격</td>
			</tr>	
		  	<c:forEach var="discount" items="${discount}">
		  	<tr>
				<td>${discount.name}</td>
				<td>${discount.price}</td>
			</tr>	
			</c:forEach>	
		</table>
	</sec:authorize>
	
	
	<!-- 로그인을 했다면 -->
	<sec:authorize access="isAuthenticated()">
		<form:form action="${pageContext.request.contextPath}/logout"
			method="POST">
			<input type="submit" value="로그아웃" />
		</form:form>
		
		<p>
			<a href="${pageContext.request.contextPath}/user/userHome">유저</a>
			<a href="${pageContext.request.contextPath}/admin/adminHome">관리자</a>
		</p>
	</sec:authorize>	
</body>
</html>