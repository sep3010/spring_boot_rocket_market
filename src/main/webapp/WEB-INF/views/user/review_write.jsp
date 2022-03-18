<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 작성</title>
</head>
<body>
	<h1>후기 작성</h1>
	<!-- 파일 등록을 위해 enctype="multipart/form-data" 설정-->
	<form:form class="writeReview" 
		action="${pageContext.request.contextPath}/user/insertReview" 
			enctype="multipart/form-data" method="post">
		<table width="900" cellpadding="0" cellspacing="0" border="1">
			<tr>
				<td>주문번호</td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td>상품명</td>
				<td></td>
			</tr>
			<tr>
				<td>별정</td>
				<td></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name=""></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="500" cols="700"></textarea></td>
			</tr>
			<tr>
				<td>사진 첨부</td>
				<td id="reviewImage">
					<input type="file" id="reviewImage" name="reviewImage" accept="image/*" multiple>
				</td>
			</tr>
		</table>
		<button id="submit">후기 등록</button>
	</form:form>
</body>
</html>