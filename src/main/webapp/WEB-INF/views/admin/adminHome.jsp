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
	<h1>ADMIN</h1>

		<form:form action="${pageContext.request.contextPath}/logout"
			method="POST">
			<input type="submit" value="로그아웃" />
		</form:form>
		
		
		<h1>관리목록</h1>
		<!--유빈 : 상품 관리 -->
		<p><a href="${pageContext.request.contextPath}/admin/productManagement">상품관리</a></p>		
		
		<!--세윤 : 회원 리스트  -->
		<br><a href="${pageContext.request.contextPath}/admin/memberList">회원 리스트</a>
	</sec:authorize>	

</body>
</html>