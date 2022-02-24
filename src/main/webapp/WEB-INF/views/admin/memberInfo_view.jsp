<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>회원 리스트</title>
<!-- 회원 정보를 볼 수 있는 페이지 -->
<style>
#submit-button {
	width: 100px;
	height: 50px;
	background-color: #98fb98;
	color: black;
	border: 3px dashed pink;
	border-radius: 5px;
}
</style>
<script>
	
</script>
</head>
<body>

	<h1>회원 정보 확인</h1>
	<table width="500 cellpadding=" 0" cellspacing="0" border="1">
		<form action="modify" method="get">
			<input type="hidden" name="id" value="${memberInfo_view.id}">

			<tr>
				<td>유저 번호</td>
				<td>${memberInfo_view.id}</td>
			</tr>

			<tr>
				<td>유저 아이디</td>
				<td>${memberInfo_view.username}</td>
			</tr>

			<tr>
				<td>닉네임</td>
				<td><input type="text" name="nickname"
					value="${memberInfo_view.nickname}"></td>
			</tr>

			<tr>
				<td>이름</td>
				<td><input type="text" name="name"
					value="${memberInfo_view.name}"></td>
			</tr>

			<tr>
				<td>연락처</td>
				<td><input type="text" name="phone"
					value="${memberInfo_view.phone}"></td>
			</tr>

			<tr>
				<td>우편 번호</td>
				<td><input type="text" name="postcode"
					value="${memberInfo_view.postcode}"></td>
			</tr>

			<tr>
				<td>주소</td>
				<td><input type="text" name="address"
					value="${memberInfo_view.address}"></td>

			</tr>

			<tr>
				<td>생일</td>
				<td><input type="date" name="birth"
					value="${memberInfo_view.birth}"></td>
			</tr>

			<tr>
				<td>이메일 주소</td>
				<td><input type="email" name="email"
					value="${memberInfo_view.email}"></td>
			</tr>

			<tr>
				<td>등급</td>
				<td>
				<label><input type="radio" name="grade" value="일반" checked>일반</label>
				<label><input type="radio" name="grade" value="로얄">로얄</label>
				<label><input type="radio" name="grade" value="VIP">VIP</label>
				</td>
			</tr>
			
	</table>

	<div>
		<input type="submit" id="submit-button" value="회원정보수정">
		<a href="delete?id=${memberInfo_view.id}">삭제</a>
	</div>

	</form>






</body>
</html>