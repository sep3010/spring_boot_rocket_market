<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	<!-- 메인으로 가는 버튼 -->
	<h1><a href="${pageContext.request.contextPath}/">Main Home</a></h1>
	<h1>Admin Home</h1>
	
	<!-- 로그인을 안했다면 -->
	<sec:authorize access="isAnonymous()">
		<p>
			<a href="${pageContext.request.contextPath}/loginForm">로그인</a>
			<a href="${pageContext.request.contextPath}/addMemberForm">회원가입</a>
		</p>
	</sec:authorize>
	
	<!-- 로그인을 했다면 -->
	<sec:authorize access="isAuthenticated()">
		<form:form action="${pageContext.request.contextPath}/logout"
			method="POST">
			<input type="submit" type="button" value="로그아웃" />
		</form:form>
		<br>
		
		<h1>관리목록</h1>
		
		<!--유빈: 상품관리-->
		<p><a href="${pageContext.request.contextPath}/admin/productManagement">상품관리</a></p>

		<!--세윤: 회원리스트-->
		<p><a href="${pageContext.request.contextPath}/admin/memberList">회원 리스트</a></p>
		
		<!--용원: 쿠폰관리-->
		<p><a href="${pageContext.request.contextPath}/admin/couponManagement">쿠폰관리</a></p>
	</sec:authorize>	
</body>
</html>