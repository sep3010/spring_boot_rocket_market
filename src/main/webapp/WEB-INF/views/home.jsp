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
	
	<!-- 카카오 로그인을 했다면 -->
<!-- <c:if test="${not empty kakaoMember}">
	 	<p>${kakaoMember.kakao_account.profile.nickname}님</p>
		<a href="/kakao/logout">로그아웃</a>
	</c:if>	
	-->
	
		<!-- ============== 상품목록페이지 이동 ================ -->
        <div id="categorymenu">
          <a class="btn btn-light" 
          href="${pageContext.request.contextPath}/newProduct" 
          role="button" id="categorybtn">신상품</a>
          <a class="btn btn-light" 
          href="${pageContext.request.contextPath}/bestProduct" 
          role="button" id="categorybtn">베스트상품</a>
          <a class="btn btn-light" 
          href="${pageContext.request.contextPath}/saleProduct"
          role="button" id="categorybtn">특가상품</a>
          <a class="btn btn-light" 
          href="${pageContext.request.contextPath}/subscribeProduct"
          role="button" id="categorybtn">정기배송상품</a>
        </div>	
        
        
        <div id="categorymenu">
          <a class="btn btn-light" 
          href="${pageContext.request.contextPath}/categoryProduct/vegetable" 
          role="button" id="categorybtn">채소/과일</a>
          <a class="btn btn-light" 
          href="${pageContext.request.contextPath}/categoryProduct/meat" 
          role="button" id="categorybtn">육류</a>
          <a class="btn btn-light" 
          href="${pageContext.request.contextPath}/categoryProduct/side"
          role="button" id="categorybtn">국/반찬</a>
          <a class="btn btn-light" 
          href="${pageContext.request.contextPath}/categoryProduct/snack"
          role="button" id="categorybtn">간식/과자</a>
          <a class="btn btn-light" 
          href="${pageContext.request.contextPath}/categoryProduct/dairy"
          role="button" id="categorybtn">유제품</a>
          <a class="btn btn-light" 
          href="${pageContext.request.contextPath}/categoryProduct/instant"
          role="button" id="categorybtn">즉석식품</a>          
        </div>	
        
        

	<!-- 접근가능페이지코드 -->		
	<h1>오늘 할인해요!</h1>
	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<td>상품이름</td>
			<td>가격</td>
		</tr>	
	  	<c:forEach var="discount" items="${discountList}">
	  	<tr>
			<td>${discount.name}</td>
			<td>${discount.price}</td>
		</tr>	
		</c:forEach>	
	</table>
	<h1>새로 나왔어요!</h1>
	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<td>상품이름</td>
			<td>가격</td>
		</tr>	
	  	<c:forEach var="newList" items="${newList}">
		  <tr>
			<td>${newList.name}</td>
			<td>${newList.price}</td>
		</tr>	
		</c:forEach>	
	</table>
	
</body>
</html>